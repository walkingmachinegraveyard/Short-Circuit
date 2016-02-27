import roslib
import rospy
import smach
import smach_ros
import actionlib
import time
import threading
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

        userdata.goal_out = 'WaitForCommand'

        return 'done'
        
                                                    
def main():

    rospy.init_node('supreme_planer')
    sm = smach.StateMachine(outcomes=[])
    
    with sm:
        ### Add states in here...
        smach.StateMachine.add('BuildGoal',
          BuildGoal(), 
          transitions={'done': 'SendGoal'},
          remapping={'goal_out': 'sm_goal',
                     'result_in': 'sm_result'})

        smach.StateMachine.add('SendGoal',
          SimpleActionState('SaraComm',
            CommAction,
            goal_slots=['goal'],
            result_slots=['result']),
          transitions={'succeeded': 'BuildGoal',
                       'preempted': 'BuildGoal',
                       'aborted': 'BuildGoal'},
          remapping={'goal': 'sm_goal',
                     'result': 'sm_result'})

        '''smach.StateMachine.add('WaitResult',
          SimpleActionState('SaraComm', 
            CommAction, 
            result_slots=['result']), 
          transitions={'succeeded':'BuildGoal',
                       'preempted':'BuildGoal',
                       'aborted':'BuildGoal'},
          remapping={'result':'sm_result'})'''

    # Create a thread to execute the smach container
    smach_thread = threading.Thread(target=sm.execute)
    smach_thread.start()

    rospy.spin()

    # Request the container to preempt
    sm.request_preempt()

    # Block until everything is preempted 
    # (you could do something more complicated to get the execution outcome if you want it)
    smach_thread.join()

if __name__ == '__main__':
      main()