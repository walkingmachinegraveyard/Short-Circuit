#!/usr/bin/env python

import roslib
import rospy
import smach
import smach_ros
import actionlib
import time
from smach_ros import SimpleActionState
from std_msgs.msg import String


# define state Idle
class Idle(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['Stop','Sarah'],
                             input_keys=['Idle_lastWord_in',
                                         'Idle_lastState_in'],
                             output_keys=['Idle_lastWord_out',
                                          'Idle_lastState_out'])
        self.word = ""
        self.state = "Idle"
        rospy.Subscriber("/recognizer_1/output", String, self.callback, queue_size=1)
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=1)
        
    def execute(self, userdata):
        rospy.loginfo('Executing state Idle')
        rospy.loginfo('Idle - Waiting for keyword: SARAH')
        self.word = ""
        while True:
            if self.word == 'stop':
                userdata.Idle_lastWord_out = self.word
                userdata.Idle_lastState_out = self.state
                return 'Stop'
            if self.word == 'sara' :
                userdata.Idle_lastWord_out = self.word
                userdata.Idle_lastState_out = self.state
                return 'Sarah'
            
    def callback(self,data): 
        if data.data == "stop":
            rospy.loginfo('Idle - Keyword STOP detected !!')
            self.word = data.data

        if data.data == "sara":
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
        rospy.Subscriber("/recognizer_1/output", String, self.callback, queue_size=1)
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

            if self.word == 'go foward':
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
            if self.word == 'sara':
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
        if data.data == "sara":
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
        rospy.Subscriber("/recognizer_1/output", String, self.callback)
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=10)
 
    def execute(self, userdata):
        rospy.loginfo('Executing state WaitingConfirmation')
        userdata.WConf_lastState_out = self.state 
        self.lastWord = userdata.WConf_lastWord_in
        self.SayX('Did you say')
        self.SayX(self.lastWord)
        self.word = ""
        timeout = time.time() + 15  # 15 sec
        while True:
            if self.word == 'stop':
                userdata.WComm_lastWord_out = self.word
                return 'Stop'

            if self.word == 'No':
                userdata.WComm_lastWord_out = self.word
                return 'No'

            if self.word == 'yes':
                userdata.WComm_lastWord_out = self.word
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
        if data.data == "sara":
            rospy.loginfo('Keyword SARAH detected !!')
            self.word = data.data
        '''
    def SayX(self, ToSay_str):
        rospy.loginfo(ToSay_str)
        self.pub.publish(ToSay_str)

# main
def main():

    # Create a SMACH state machine
    sm = smach.StateMachine(outcomes=[])

    with sm:
        # Add states to the container
        smach.StateMachine.add('Idle', Idle(),
                               transitions={'Sarah':'WaitingCommand',
                                            'Stop':'Idle'},
                               remapping={'Idle_lastWord_in':'lastWord',
                                          'Idle_lastState_in':'lastState',
                                          'Idle_lastWord_out':'lastWord',
                                          'Idle_lastState_out':'lastState'})

        smach.StateMachine.add('WaitingCommand', WaitingCommand(),
                               transitions={'Stop':'Idle',
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
                                            'Yes':'Idle',
                                            'No':'Idle',
                                            'Stop':'Idle',
                                            'Sarah':'WaitingCommand'},
                               remapping={'WConf_lastWord_in':'lastWord',
                                          'WConf_lastState_in':'lastState',
                                          'WConf_lastWord_out':'lastWord',
                                          'WConf_lastState_out':'lastState'})

    # Execute SMACH plan
    sm.execute()


if __name__ == '__main__':
    rospy.init_node('interpreter')
    try:
        main()
        rospy.spin()
    except:
        pass