import roslib
import rospy
import smach
import smach_ros
import actionlib
import time
from smach_ros import SimpleActionState
from std_msgs.msg import String
from wm_interpreter.msg import *


# define state Idle
class BuildGoal(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['done'],
                             input_keys=['result_in'],
                             output_keys=['goal_out'])
        
    def execute(self, userdata):
        rospy.loginfo('Executing state SendGoal')

        userdata.goal_out = 'WaitCommand'

        return 'done'
        
                                                    
def main():

    sm = smach.StateMachine(outcomes=[])
    
    with sm:
        ### Add states in here...
        smach.StateMachine.add('BuildGoal',
          BuildGoal(), 
          transitions={'done':'SendGoal'},
          remapping={'goal_out':'sm_goal', 
          'result_in':'sm_result'})

        smach.StateMachine.add('SendGoal',
          SimpleActionState('SaraComm',
            CommAction,
            goal_slots=['goal']),
          transitions={'succeeded':'BuildGoal',
                       'preempted':'BuildGoal',
                       'aborted':'BuildGoal'},
          remapping={'goal':'sm_goal'})

        '''smach.StateMachine.add('WaitResult',
          SimpleActionState('SaraComm', 
            CommAction, 
            result_slots=['result']), 
          transitions={'succeeded':'BuildGoal',
                       'preempted':'BuildGoal',
                       'aborted':'BuildGoal'},
          remapping={'result':'sm_result'})'''

	# Execute SMACH plan
	sm.execute()


if __name__ == '__main__':
    rospy.init_node('Supreme_Planer')
    try:
      main()
      rospy.spin()
    except:
        pass