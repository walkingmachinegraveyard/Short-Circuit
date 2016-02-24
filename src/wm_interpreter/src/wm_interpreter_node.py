#!/usr/bin/env python

import roslib
import rospy
import smach
import smach_ros
import actionlib
import time
import threading
from smach_ros import SimpleActionState
from smach_ros import ActionServerWrapper
from std_msgs.msg import String
from wm_interpreter.msg import *

TIMEOUT_LENGTH = 15

RECOGNIZER_CALLBACK = None

def handleRecognizerMessage(msg):
    if RECOGNIZER_CALLBACK is not None:
        RECOGNIZER_CALLBACK(msg)

# define state Idle
class Idle(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['Stop', 'Sarah'],
                             input_keys=['Idle_lastWord_in',
                                         'Idle_lastState_in',
                                         'Idle_goal_in'],
                             output_keys=['Idle_lastWord_out',
                                          'Idle_lastState_out'])
        self.word = ""
        self.state = "Idle"
        self.KEYWORDS = {'stop': 'Stop',
                         'sarah': 'Sarah'}

        global RECOGNIZER_CALLBACK
        RECOGNIZER_CALLBACK = self.callback
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=1)
        
    def execute(self, userdata):
        rospy.loginfo('-- Executing state Idle --')
        rospy.loginfo('Idle - Waiting for keyword: SARAH')

        self.word = ""
        '''while userdata.Idle_goal_in != 'WaitCommand':
            continue'''
        rospy.loginfo('Idle - Goal received !!')
        while True:
            if self.word in self.KEYWORDS:
                userdata.Idle_lastWord_out = self.word
                userdata.Idle_lastState_out = self.state
                return self.KEYWORDS[self.word]

    def callback(self,data):
        toLog = 'Idle - Keyword'
        if self.word in self.KEYWORDS:
            toLog += ' ' + self.KEYWORDS
            self.word = data.data
            rospy.loginfo(toLog)

    def SayX(self, ToSay_str):
        rospy.loginfo(ToSay_str)
        self.pub.publish(ToSay_str)


# define state WaitingCommand
class WaitingCommand(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['Command', 'Sarah', 'Stop', 'DoIt', 'Timeout'],
                             input_keys=['WComm_lastWord_in',
                                         'WComm_lastState_in'],
                             output_keys=['WComm_lastWord_out',
                                          'WComm_lastState_out',
                                          'WComm_lastCommand_out'])
        self.word = ""
        self.state = "WaitingCommand"
        self.KEYWORDS = {'stop': 'Stop',
                         'sarah': 'Sarah',
                         'say hello': 'Timeout',
                         'go foward': 'Command',
                         'get me the beer': 'Command',
                         'go backward': 'Command',
                         'rotate left': 'Command',
                         'rotate right': 'Command'}


        global RECOGNIZER_CALLBACK
        RECOGNIZER_CALLBACK = self.callback
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=1)

    def execute(self, userdata):
        rospy.loginfo('Executing state WaitingCommand')

        userdata.WComm_lastState_out = self.state

        self.SayX('Yes master')
        self.word = ""

        timeout = time.time() + TIMEOUT_LENGTH  # 15 sec
        while True:
            if self.word in self.KEYWORDS:

                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastCommand_out = self.word

                if self.word == 'say hello':
                    self.SayX('Hi. I am a assistance robot here to serve you. I am not totally functional for now,'
                              ' but soon i will be able to do the chores for you.')

                return self.KEYWORDS[self.word]

            if time.time() > timeout:
                userdata.WComm_lastState_out = self.state  
                return 'Timeout'

    def callback(self,data):
        toLog = 'WComm - keyword'
        if self.word in self.KEYWORDS:
            toLog += ' ' + self.KEYWORDS
            self.word = data.data
            rospy.loginfo(toLog)

    def SayX(self, ToSay_str):
        rospy.loginfo(ToSay_str)
        self.pub.publish(ToSay_str)


# define state WaitingConfirmation
class WaitingConfirmation(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['Timeout', 'Yes', 'No', 'Stop', 'Sarah'],
                             input_keys=['WConf_lastWord_in',
                                         'WConf_lastState_in'],
                             output_keys=['WConf_lastWord_out',
                                          'WConf_lastState_out'])
        self.word = ""
        self.state = "WaitingConfirmation"
        self.lastWord = ''
        self.KEYWORDS = {'stop': 'Stop',
                         'sarah': 'Sarah',
                         'say hello': 'Timeout',
                         'yes': 'Command',
                         'no': 'Command'}

        global RECOGNIZER_CALLBACK
        RECOGNIZER_CALLBACK = self.callback
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=1)
 
    def execute(self, userdata):
        rospy.loginfo('-- Executing state WaitingConfirmation --')

        userdata.WConf_lastState_out = self.state 
        self.lastWord = userdata.WConf_lastWord_in

        self.SayX('Did you say')
        self.SayX(self.lastWord)
        self.word = ""
        timeout = time.time() + TIMEOUT_LENGTH  # 15 sec

        while True:
            if self.word in self.KEYWORDS:
                userdata.WConf_lastWord_out = self.word
                userdata.WConf_lastState_out = self.state
                return self.KEYWORDS[self.word]

            if time.time() > timeout:
                return 'Timeout'

    def callback(self,data):
        toLog = 'WConf - keyword'
        if self.word in self.KEYWORDS:
            toLog += ' ' + self.KEYWORDS
            self.word = data.data
            rospy.loginfo(toLog)

    def SayX(self, ToSay_str):
        rospy.loginfo(ToSay_str)
        self.pub.publish(ToSay_str)

# define state DoSomething
class DoSomething(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['Done'],
                             input_keys=['DSome_lastWord_in',
                                         'DSome_lastState_in',
                                         'DSome_lastCommand_in'],
                             output_keys=['DSome_lastWord_out',
                                          'DSome_lastState_out',
                                          'DSome_result_out'])
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=1)
        self.pubFollow = rospy.Publisher('voice_follow_flag', String, queue_size=1)
        #self.pubEmo = rospy.Publisher('control_emo', int, queue_size=10)

        self.lastWord = ""
        self.lastState = ""
        self.lastCommand = ""
        self.state = "DoSomething"
        self.KEYWORDS = {'stop': 'Stop',
                         'sarah': 'Sarah',
                         'say hello': 'Timeout',
                         'go foward': 'Command',
                         'get me the beer': 'Command',
                         'go backward': 'Command',
                         'rotate left': 'Command',
                         'rotate right': 'Command'}
 
    def execute(self, userdata):
        rospy.loginfo('-- Executing state DoSomething --')

        self.lastWord = userdata.DSome_lastWord_in
        self.lastState = userdata.DSome_lastState_in
        self.lastCommand = userdata.DSome_lastCommand_in
        userdata.DSome_lastState_out = self.state

        if self.lastCommand == "stop":
                userdata.DSome_lastState_out = self.state  
                userdata.DSome_result_out = 'stop'
                return 'Done'

        if self.lastCommand == "go foward":
                userdata.DSome_lastState_out = self.state
                userdata.DSome_result_out = 'foward'
                return 'Done'

        if self.lastCommand == "go backward":
                userdata.DSome_lastState_out = self.state 
                userdata.DSome_result_out = 'backward'
                return 'Done'
  
        if self.lastCommand == "Rotate left":
                userdata.DSome_lastState_out = self.state
                userdata.DSome_result_out = 'rotleft'    
                return 'Done'

        if self.lastCommand == "Rotate right":
                userdata.DSome_lastState_out = self.state
                userdata.DSome_result_out = 'rotright'    
                return 'Done'
        else:
            return 'Idle'
# main
def main():

    rospy.init_node('interpreter')
    rospy.Subscriber("/recognizer_1/output", String, handleRecognizerMessage, queue_size=1)

    # Create a SMACH state machine
    sm = smach.StateMachine(outcomes=['success', 'aborted', 'preempted'],
                            input_keys = ['goal'],
                            output_keys = ['result'])

    with sm:
        # Add states to the container
        smach.StateMachine.add('Idle', Idle(),
                               transitions={'Sarah': 'WaitingCommand',
                                            'Stop': 'Idle'},
                               remapping={'Idle_lastWord_in': 'lastWord',
                                          'Idle_lastState_in': 'lastState',
                                          'Idle_lastWord_out': 'lastWord',
                                          'Idle_lastState_out': 'lastState'})

        smach.StateMachine.add('WaitingCommand', WaitingCommand(),
                               transitions={'Stop': 'Idle',
                                            'DoIt': 'DoSomething',
                                            'Sarah': 'WaitingCommand',
                                            'Command': 'WaitingConfirmation',
                                            'Timeout': 'Idle'},
                               remapping={'WComm_lastWord_in': 'lastWord',
                                          'WComm_lastState_in': 'lastState',
                                          'WComm_lastWord_out': 'lastWord',
                                          'WComm_lastState_out': 'lastState',
                                          'WComm_lastCommand_out': 'lastCommand'})

        smach.StateMachine.add('WaitingConfirmation', WaitingConfirmation(),
                               transitions={'Timeout': 'Idle',
                                            'Yes': 'Idle',
                                            'No': 'Idle',
                                            'Stop': 'Idle',
                                            'Sarah': 'WaitingCommand'},
                               remapping={'WConf_lastWord_in': 'lastWord',
                                          'WConf_lastState_in': 'lastState',
                                          'WConf_lastWord_out': 'lastWord',
                                          'WConf_lastState_out': 'lastState'})

        smach.StateMachine.add('DoSomething', DoSomething(),
                               transitions={'Done': 'Idle'},
                               remapping={'DSome_lastWord_in': 'lastWord',
                                          'DSome_lastState_in': 'lastState',
                                          'DSome_lastCommand_in': 'lastCommand',
                                          'DSome_lastWord_out': 'lastWord',
                                          'DSome_lastState_out': 'lastState',
                                          'DSome_result_out': 'result'})

    # Construct action server wrapper
    asw = smach_ros.ActionServerWrapper('SaraComm', CommAction,
                              wrapped_container = sm,
                              goal_key = 'goal',
                              result_key = 'result',
                              succeeded_outcomes = ['success'],
                              aborted_outcomes = ['aborted'],
                              preempted_outcomes = ['preempted'])

    sis = smach_ros.IntrospectionServer('server_name', asw.wrapped_container, '/ASW_ROOT')


    # Create a thread to execute the smach container
    smach_thread = threading.Thread(target=sis.start)
    smach_thread.start()

    rospy.spin()

   # Request the container to preempt
    sm.request_preempt()

    smach_thread.join()


if __name__ == '__main__':
    main()