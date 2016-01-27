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
        rospy.Subscriber("/recognizer_1/output", String, self.callback)
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=10)
        
    def execute(self, userdata):
        rospy.loginfo('Executing state Idle')
        rospy.loginfo('Waiting for keyword: SARAH')

        while true:
            if self.word == 'stop':
                userdata.Idle_lastWord_out = self.word
                userdata.Idle_lastState_out = self.state
                return 'Stop'
            if self.word == 'sarah':
                userdata.Idle_lastWord_out = self.word
                userdata.Idle_lastState_out = self.state
                return 'Sarah'
            
    def callback(self,data): 
        if data.data.find("stop"):
            rospy.loginfo('Keyword STOP detected !!')
            self.word = data.data

        if data.data.find("sarah"):
            rospy.loginfo('Keyword SARAH detected !!')
            self.word = data.datat

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
        rospy.Subscriber("/recognizer_1/output", String, self.callback)
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=10)

    def execute(self, userdata):
        rospy.loginfo('Executing state WaitingCommand')
        userdata.WComm_lastState_out = self.state

        self.SayX('Yes master yoda')

        timeout = time.time() + 10  # 10 sec
        while true:
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

            if self.word == 'go backward':
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastCommand_out = self.word    
                return 'Command'

            if self.word == 'sarah':
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastCommand_out = self.word
                return 'Sarah'

            if time.time() > timeout:
                userdata.WComm_lastState_out = self.state  
                return 'Timeout'

    def callback(self,data): 
        if data.data.find("stop"):
            rospy.loginfo('Keyword STOP detected !!')
            self.word = data.data

        if data.data.find('bring me the beer'):
            rospy.loginfo('Phrase BRING ME THE BEER detected !!')
            self.word = data.data

        if data.data.find("sarah"):
            rospy.loginfo('Keyword SARAH detected !!')
            self.word = data.data

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
        rospy.Subscriber("/recognizer_1/output", String, self.callback)
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=10)
 
    def execute(self, userdata):
        rospy.loginfo('Executing state WaitingConfirmation')
        userdata.WComm_lastState_out = self.state 

        self.SayX('Did you say')
        self.SayX(self.lastWord)

        timeout = time.time() + 10  # 10 sec
        while true:
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
        if data.data.find("stop"):
            rospy.loginfo('Keyword STOP detected !!')
            self.word = data.data

        if data.data.find('yes'):
            rospy.loginfo('Keyword YES detected !!')
            self.word = data.data

        if data.data.find('no'):
            rospy.loginfo('Keyword NO detected !!')
            self.word = data.data

        if data.data.find("sarah"):
            rospy.loginfo('Keyword SARAH detected !!')
            self.word = data.datat

    def SayX(self, ToSay_str):
        rospy.loginfo(ToSay_str)
        self.pub.publish(ToSay_str)


# define state DoSomething
class DoSomething(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['Stop','Foward','Backward','RotLeft','RotRight'],
                             input_keys=['DSome_lastWord_in',
                                         'DSome_lastState_in',
                                         'DSome_lastCommand_in'],
                             output_keys=['DSome_lastWord_out',
                                         'DSome_lastState_out'])
        self.pub = rospy.Publisher('SaraVoice', String, queue_size=10)
        self.lastWord = ""
        self.lastState = ""
        self.lastCommand = ""
        self.state = "DoSomething"
 
    def execute(self, userdata):
        rospy.loginfo('Executing state DoSomething')
        self.lastWord = userdata.DSome_lastWord_in
        self.lastState = userdata.DSome_lastState_in
        self.lastCommand = userdata.DSome_lastState_in
        userdata.DSome_lastState_out = self.state
        
        if self.lastCommand == "stop":
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastState_out = self.state    
                return 'Stop'

        if self.lastCommand == "go foward":
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastState_out = self.state    
                return 'Foward'

        if self.lastCommand == "go backward":
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastState_out = self.state    
                return 'Backward'

        if self.lastCommand == "Rotate left":
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastState_out = self.state    
                return 'RotLeft'

        if self.lastCommand == "Rotate right":
                userdata.WComm_lastWord_out = self.word
                userdata.WComm_lastState_out = self.state    
                return 'RotRight'


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
                                            'Stop':'DoSomething'},
                               remapping={'Idle_lastWord_in':'lastWord',
                                          'Idle_lastState_in':'lastState',
                                          'Idle_lastWord_out':'lastWord',
                                          'Idle_lastState_out':'lastState'})

        smach.StateMachine.add('WaitingCommand', WaitingCommand(),
                               transitions={'Stop':'DoSomething',
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
                               transitions={'Stop':'Stop',
                                            'Foward':'Foward',
                                            'Backward':'Backward',
                                            'RotLeft':'RotLeft',
                                            'RotRight':'RotRight'},
                               remapping={'DSome_lastWord_in':'lastWord',
                                          'DSome_lastState_in':'lastState',
                                          'DSome_lastWord_out':'lastWord',
                                          'DSome_lastState_out':'lastState',
                                          'DSome_lastCommand_in':'lastCommand'})

        smach.StateMachine.add('Stop',
                                SimpleActionState('Supreme_Planer',
                                GlobalAction,
                                goal='Stop'),
                                transitions={'succeeded':'Idle'})

        smach.StateMachine.add('Foward',
                                SimpleActionState('Supreme_Planer',
                                GlobalAction,
                                goal='Foward'),
                                transitions={'succeeded':'Idle'})

        smach.StateMachine.add('Backward',
                                SimpleActionState('Supreme_Planer',
                                GlobalAction,
                                goal='Backward'),
                                transitions={'succeeded':'Idle'})

        smach.StateMachine.add('RotLeft',
                                SimpleActionState('Supreme_Planer',
                                GlobalAction,
                                goal='RotLeft'),
                                transitions={'succeeded':'Idle'})

        smach.StateMachine.add('RotRight',
                                SimpleActionState('Supreme_Planer',
                                GlobalAction,
                                goal='RotRight'),
                                transitions={'succeeded':'Idle'})

  #    smach.StateMachine.add('CheckState', CheckState(),
  #                             transitions={'ConfirmationDetected':'SaySomthing'},
  #                             remapping={'WConf_lastWord_in':'lastWord',
  #                                        'WConf_lastState_in':'lastState',
  #                                        'WConf_lastWord_out':'lastWord',
  #                                        'WConf_lastState_out':'lastState'})


    # Execute SMACH plan
    sm.execute()


if __name__ == '__main__':
    rospy.init_node('interpreter')
    try:
        main()
        rospy.spin()
    except:
        pass