#!/usr/bin/env python

import rospy
from roboteq_msgs.msg import Feedback
from geometry_msgs.msg import Pose, TransformStamped
from nav_msgs.msg import Odometry
import message_filters
import tf2_ros
import tf_conversions
import approxsync


class OdometryFeedback:

    def __init__(self):

        # get parameters
        self.alpha = rospy.get_param('alpha', 0.31)
        self.beta = rospy.get_param('beta', 0.30)
        self.wheel_radius = rospy.get_param('wheel_radius', 0.075)
        self.child_id = rospy.get_param('child_frame_id', "base_link")
        self.frame_id = rospy.get_param('frame_id', "odom")

        self.prev_time = rospy.Time()

        # direct kinematics matrix
        self.dk_x = [1.0/4, -1.0/4, 1.0/4, -1.0/4]
        self.dk_y = [-1.0/4, -1.0/4, 1.0/4, 1.0/4]
        self.dk_yaw = [-1.0/(4*(self.alpha+self.beta)), -1.0/(4*(self.alpha+self.beta)),
                       -1.0/(4*(self.alpha+self.beta)), -1.0/(4*(self.alpha+self.beta))]

        # ApproximateTimeSynchronizer setup
        self.FLW_fb = message_filters.Subscriber('roboteq_driver_FLW/feedback', Feedback, queue_size=2)
        self.FRW_fb = message_filters.Subscriber('roboteq_driver_FRW/feedback', Feedback, queue_size=2)
        self.RLW_fb = message_filters.Subscriber('roboteq_driver_RLW/feedback', Feedback, queue_size=2)
        self.RRW_fb = message_filters.Subscriber('roboteq_driver_RRW/feedback', Feedback, queue_size=2)

        self.async = approxsync.ApproximateSynchronizer(1, [self.FLW_fb, self.FRW_fb,
                                                            self.RLW_fb, self.RRW_fb], 1)

        self.async.registerCallback(self.callback)

        # variable to save updated position and orientation
        self.pose = Pose()

        # delta time between callbacks
        self.dt = 1.0/50      # 50Hz, default publish rate of Feedback messages

        self.pub = rospy.Publisher('odom', Odometry, queue_size=1)

        self.tf_br = tf2_ros.TransformBroadcaster()

        # self.cb_rate = rospy.Time.now()

    def callback(self, flw, frw, rlw, rrw):

        odom = Odometry()

        tf = TransformStamped()

        current_time = rospy.Time.now()

        # dt = current_time.to_sec() - self.cb_rate.to_sec()

        # rospy.loginfo("Time between callbacks = %f", dt)

        odom.header.stamp = current_time
        odom.header.frame_id = self.frame_id
        odom.child_frame_id = self.child_id

        tf.header.stamp = current_time
        tf.header.frame_id = self.frame_id
        tf.child_frame_id = self.child_id

        # x axis linear velocity
        dx = self.wheel_radius * (self.dk_x[0]*flw.measured_velocity +
                                  self.dk_x[1]*frw.measured_velocity +
                                  self.dk_x[2]*rlw.measured_velocity +
                                  self.dk_x[3]*rrw.measured_velocity)

        odom.twist.twist.linear.x = dx

        # update x position
        self.pose.position.x += self.dt * dx

        # y axis linear velocity
        dy = self.wheel_radius * (self.dk_y[0]*flw.measured_velocity +
                                  self.dk_y[1]*frw.measured_velocity +
                                  self.dk_y[2]*rlw.measured_velocity +
                                  self.dk_y[3]*rrw.measured_velocity)

        odom.twist.twist.linear.y = dy
        # update y position
        self.pose.position.y += self.dt * dy

        # yaw angular velocity
        dYaw = self.wheel_radius * (self.dk_yaw[0]*flw.measured_velocity +
                                    self.dk_yaw[1]*frw.measured_velocity +
                                    self.dk_yaw[2]*rlw.measured_velocity +
                                    self.dk_yaw[3]*rrw.measured_velocity)

        odom.twist.twist.angular.z = dYaw

        # update pose orientation
        # convert orientation to RPY
        # euler = [roll, pitch, yaw]
        euler = tf_conversions.transformations.euler_from_quaternion([self.pose.orientation.x,
                                                                     self.pose.orientation.y,
                                                                     self.pose.orientation.z,
                                                                     self.pose.orientation.w])

        # add yaw variation to RPY and convert orientation back to quaternion
        q = tf_conversions.transformations.quaternion_from_euler(0.0, 0.0, euler[2] + dYaw * self.dt)
        self.pose.orientation.x = q[0]
        self.pose.orientation.y = q[1]
        self.pose.orientation.z = q[2]
        self.pose.orientation.w = q[3]

        odom.pose.pose = self.pose

        # update tf
        tf.transform.translation.x = dx * self.dt
        tf.transform.translation.y = dy * self.dt
        tf.transform.translation.z = dYaw * self.dt

        q1 = tf_conversions.transformations.quaternion_from_euler(0.0, 0.0, dYaw * self.dt)
        tf.transform.rotation.x = q1[0]
        tf.transform.rotation.y = q1[1]
        tf.transform.rotation.z = q1[2]
        tf.transform.rotation.w = q1[3]

        # publish odom and send transform
        self.pub.publish(odom)

        self.tf_br.sendTransform(tf)

        # self.cb_rate = rospy.Time.now()


if __name__ == '__main__':

    try:
        rospy.init_node('wm_odometry_feedback_node')

        OdometryFeedback()

        rospy.spin()

    except rospy.ROSInterruptException:
        pass

