import roslib
import rospy
import smach
import smach_ros
import actionlib
import time
from smach_ros import SimpleActionState
from smach_ros import ActionServerWrapper
from std_msgs.msg import String
from chores.msg import DoDishesAction, DoDishesServer


# define state Idle
class Idle(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['Idle'])

        self.word = ""
        self.state = "Idle"
        self.pub = rospy.Publisher('SaraAction', String, queue_size=10)
        
    def execute(self, userdata):
        rospy.loginfo('Executing state SupremeIdle')

        while true:
            rospy.loginfo(userdata.Goal)
            self.pub.publish(userdata.Goal)
                                                    
def main():

	sm = smach.StateMachine(outcomes=['success',
                            	'aborted',
                            	'preempted'],
                      input_keys = ['sm_Goal'],
                      output_keys = ['sm_Result'])
	with sm:
    ### Add states in here...
            smach.StateMachine.add('Idle', Idle(),
                               transitions={'Idle':'Idle'},
                               remapping={'Idle_Goal':'sm_Goal',
                                          'Idle_Result':'sm_Result'})

	# Construct action server wrapper
	asw = smach_ros.ActionServerWrapper('Supreme_Planer', GlobalAction,
    						  wrapped_container = sm,
                              goal_key = 'Goal',
                              result_key = 'Result',
    						  succeeded_outcomes = ['success'],
    						  aborted_outcomes = ['aborted'],
    						  preempted_outcomes = ['preempted'])

	# Run the server in a background thread
	asw.run_server()


if __name__ == '__main__':
    rospy.init_node('Supreme_Planer')
    main()
    rospy.spin()