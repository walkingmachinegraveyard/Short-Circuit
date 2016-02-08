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

RECOGNIZER_CALLBACK = None

def handleRecognizerMessage(msg):
    if RECOGNIZER_CALLBACK is not None:
        RECOGNIZER_CALLBACK(msg)

# define state Idle
class Idle(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['Stop','Sarah','NoGoal'],
                             input_keys=['Idle_lastWord_in',
                                         'Idle_lastState_in',
                                         'Idle_goal_in'],
                             output_keys=['Idle_lastWord_out',
                                          'Idle_lastState_out'])
        self.word = ""
        self.state = "Idle"

        global RECOGNIZER_CALLBACK
        RECOGNIZER_CALLBACK = self.callback
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=1)
        
    def execute(self, userdata):
        rospy.loginfo('-- Executing state Idle --')
        rospy.loginfo('Idle - Waiting for keyword: SARAH')

        self.word = ""
        '''while userdata.Idle_goal_in != 'WaitCommand':
            continue'''
        rospy.loginfo('Idle - Goal recived !!')
        while True:
            if self.word == 'stop':
                userdata.Idle_lastWord_out = self.word
                userdata.Idle_lastState_out = self.state
                return 'Stop'
            if self.word == 'sarah' :
                userdata.Idle_lastWord_out = self.word
                userdata.Idle_lastState_out = self.state
                return 'Sarah'
            
    def callback(self,data): 
        if data.data == "stop":
            rospy.loginfo('Idle - Keyword STOP detected !!')
            self.word = data.data

        if data.data == "sarah":
            rospy.loginfo('Idle - Keyword SARAH detected !!')
            self.word = data.data

    def SayX(self, ToSay_str):
        rospy.loginfo(ToSay_str)
        self.pub.publish(ToSay_str)


# define state WaitingCommand
class WaitingCommand(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['Command','Sarah','Stop','Timeout'],
                             input_keys=['WComm_lastWord_in',
                                         'WComm_lastState_in'],
                             output_keys=['WComm_lastWord_out',
                                          'WComm_lastState_out',
                                          'WComm_lastCommand_out'])
        self.word = ""
        self.state = "WaitingCommand"

        global RECOGNIZER_CALLBACK
        RECOGNIZER_CALLBACK = self.callback
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=1)

    def execute(self, userdata):
        rospy.loginfo('Executing state WaitingCommand')

        userdata.WComm_lastState_out = self.state

        self.SayX('Yes master')
        self.word = ""
        timeout = time.time() + 15  # 15 sec
        while True:
            if self.word == 'stop':
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastCommand_out = self.word
                return 'Stop'

            if self.word == 'say hello':
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastCommand_out = self.word  
                self.SayX('Hi. I am a assistance robot here to serve you. I am not totally fonctionnal for now, but soon i will be able to do the chores for you.')  
                return 'Timeout'

            if self.word == 'go foward':
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastCommand_out = self.word    
                return 'Command'

            if self.word == 'get me the beer':
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastCommand_out = self.word
                return 'Command'

            if self.word == 'go backward':
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastCommand_out = self.word    
                return 'Command'

            if self.word == 'rotate left':
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastCommand_out = self.word    
                return 'Command'

            if self.word == 'rotate right':
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastCommand_out = self.word    
                return 'Command'
            '''
            if self.word == 'sarah':
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastCommand_out = self.word
                return 'Sarah'
            '''
            if time.time() > timeout:
                userdata.WComm_lastState_out = self.state  
                return 'Timeout'

    def callback(self,data): 
        if data.data == "stop":
            rospy.loginfo('Wcomm - Keyword STOP detected !!')
            self.word = data.data

        if data.data == "get me the beer":
            rospy.loginfo('Wcomm - Phrase SAY HI detected !!')
            self.word = data.data

        if data.data == "say hello":
            rospy.loginfo('Wcomm - Phrase SAY HI detected !!')
            self.word = data.data

        if data.data == 'go foward':
            rospy.loginfo('Wcomm - Phrase GO FOWARD detected !!')
            self.word = data.data

        if data.data == 'go backward':
            rospy.loginfo('Wcomm - Phrase GO BACKWARD detected !!')
            self.word = data.data

        if data.data == 'rotate left':
            rospy.loginfo('Wcomm - Phrase ROTATE LEFT detected !!')
            self.word = data.data

        if data.data == 'rotate right':
            rospy.loginfo('Wcomm - Phrase ROTATE RIGHT detected !!')
            self.word = data.data
        '''
        if data.data == "sarah":
            rospy.loginfo('Wcomm - Keyword SARAH detected !!')
            self.word = data.data
        '''
    def SayX(self, ToSay_str):
        rospy.loginfo(ToSay_str)
        self.pub.publish(ToSay_str)


# define state WaitingConfirmation
class WaitingConfirmation(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['Timeout','Yes','No','Stop','Sarah'],
                             input_keys=['WConf_lastWord_in',
                                         'WConf_lastState_in'],
                             output_keys=['WConf_lastWord_out',
                                         'WConf_lastState_out'])
        self.word = ""
        self.state = "WaitingConfirmation"
        self.lastWord = ''

        global RECOGNIZER_CALLBACK
        RECOGNIZER_CALLBACK = self.callback
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=10)
 
    def execute(self, userdata):
        rospy.loginfo('-- Executing state WaitingConfirmation --')

        userdata.WConf_lastState_out = self.state 
        self.lastWord = userdata.WConf_lastWord_in

        self.SayX('Did you say')
        self.SayX(self.lastWord)
        self.word = ""
        timeout = time.time() + 15  # 15 sec
        while True:
            if self.word == 'stop':
                userdata.WConf_lastWord_out = self.word
                return 'Stop'

            if self.word == 'No':
                userdata.WConf_lastWord_out = self.word
                return 'No'

            if self.word == 'yes':
                userdata.WConf_lastWord_out = self.word
                return 'Yes'

            if time.time() > timeout:
                return 'Timeout'

    def callback(self,data): 
        if data.data == "stop":
            rospy.loginfo('Keyword STOP detected !!')
            self.word = data.data

        if data.data == 'yes':
            rospy.loginfo('Keyword YES detected !!')
            self.word = data.data

        if data.data == 'no':
            rospy.loginfo('Keyword NO detected !!')
            self.word = data.data
        '''
        if data.data == "sarah":
            rospy.loginfo('Keyword SARAH detected !!')
            self.word = data.data
        '''
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
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=10)

        self.lastWord = ""
        self.lastState = ""
        self.lastCommand = ""
        self.state = "DoSomething"
 
    def execute(self, userdata):
        rospy.loginfo('-- Executing state DoSomething --')

        self.lastWord = userdata.DSome_lastWord_in
        self.lastState = userdata.DSome_lastState_in
        self.lastCommand = userdata.DSome_lastCommand_in
        userdata.DSome_lastState_out = self.state
        
        rospy.loginfo('yolo 0')
        if self.lastCommand == "stop":
                userdata.DSome_lastState_out = self.state  
                userdata.DSome_result_out = 'stop'
                return 'Done'

        if self.lastCommand == "go foward":
                rospy.loginfo('yolo 1')
                userdata.DSome_lastState_out = self.state
                userdata.DSome_result_out = 'foward'
                rospy.loginfo('yolo 2')   
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
        rospy.loginfo('yolo 3')
# main
def main():

    rospy.init_node('interpreter')
    rospy.Subscriber("/recognizer_1/output", String, handleRecognizerMessage, queue_size=1)

    # Create a SMACH state machine
    sm = smach.StateMachine(outcomes=['success','aborted','preempted'],
                            input_keys = ['goal'],
                            output_keys = ['result'])

    with sm:
        # Add states to the container
        smach.StateMachine.add('Idle', Idle(),
                               transitions={'Sarah':'WaitingCommand',
                                            'Stop':'DoSomething',
                                            'NoGoal':'aborted'},
                               remapping={'Idle_lastWord_in':'lastWord',
                                          'Idle_lastState_in':'lastState',
                                          'Idle_lastWord_out':'lastWord',
                                          'Idle_lastState_out':'lastState',
                                          'Idle_goal_in':'goal'})

        smach.StateMachine.add('WaitingCommand', WaitingCommand(),
                               transitions={'Stop':'DoSomething',
                                            'Sarah':'WaitingCommand',
                                            'Command':'WaitingConfirmation',
                                            'Timeout':'Idle'},
                               remapping={'WComm_lastWord_in':'lastWord',
                                          'WComm_lastState_in':'lastState',
                                          'WComm_lastWord_out':'lastWord',
                                          'WComm_lastState_out':'lastState',
                                          'WComm_lastCommand_out':'lastCommand'})

        smach.StateMachine.add('WaitingConfirmation', WaitingConfirmation(),
                               transitions={'Timeout':'Idle',
                                            'Yes':'DoSomething',
                                            'No':'WaitingCommand',
                                            'Stop':'DoSomething',
                                            'Sarah':'WaitingCommand'},
                               remapping={'WConf_lastWord_in':'lastWord',
                                          'WConf_lastState_in':'lastState',
                                          'WConf_lastWord_out':'lastWord',
                                          'WConf_lastState_out':'lastState'})

        smach.StateMachine.add('DoSomething', DoSomething(),
                               transitions={'Done':'success'},
                               remapping={'DSome_lastWord_in':'lastWord',
                                          'DSome_lastState_in':'lastState',
                                          'DSome_lastCommand_in':'lastCommand',
                                          'DSome_lastWord_out':'lastWord',
                                          'DSome_lastState_out':'lastState',
                                          'DSome_result_out':'result'})

    # Construct action server wrapper
    asw = smach_ros.ActionServerWrapper('SaraComm', CommAction,
                              wrapped_container = sm,
                              goal_key = 'goal',
                              result_key = 'result',
                              succeeded_outcomes = ['success'],
                              aborted_outcomes = ['aborted'],
                              preempted_outcomes = ['preempted'])

    # Create a thread to execute the smach container
    smach_thread = threading.Thread(target=asw.run_server())
    smach_thread.start()

    rospy.loginfo('main loop')
    rospy.spin()

    smach_thread.join()


if __name__ == '__main__':
    main()