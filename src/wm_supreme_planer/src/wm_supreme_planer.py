import roslib
import rospy
import smach
import smach_ros
import actionlib
import time
from smach_ros import SimpleActionState
from smach_ros import ActionServerWrapper
from std_msgs.msg import String

def main():

	sm = StateMachine(outcomes=['success',
                            	'aborted',
                            	'preempted'])
	with sm:
    ### Add states in here...

	# Construct action server wrapper
	asw = ActionServerWrapper('Supreme_Planer', GlobalAction,
    						  wrapped_container = sm,
    						  succeeded_outcomes = ['success'],
    						  aborted_outcomes = ['aborted'],
    						  preempted_outcomes = ['preempted'] )

	# Run the server in a background thread
	asw.run_server()


if __name__ == '__main__':
    rospy.init_node('Supreme_Planer')
    try:
        main()
        rospy.spin()
    except:
        pass