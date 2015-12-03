/*
 * wm_odometry_feedback.h
 *
 *  Created on: Nov 21, 2015
 *      Author: xhache
 */

#ifndef WM_ODOMETRY_FEEDBACK_H_
#define WM_ODOMETRY_FEEDBACK_H_

#include "ros/ros.h"
#include "tf2_ros/transform_broadcaster.h"
#include "roboteq_msgs/Feedback.h"
#include "nav_msgs/Odometry.h"
#include "message_filters/sync_policies/approximate_time.h"
#include "geometry_msgs/TransformStamped.h"
#include "tf2/LinearMath/Quaternion.h"

typedef message_filters::sync_policies::ApproximateTime<roboteq_msgs::Feedback, roboteq_msgs::Feedback, roboteq_msgs::Feedback, roboteq_msgs::Feedback> MySyncPolicy;

class WM_Odometry_Feedback
{
public:

	WM_Odometry_Feedback(float alpha_, float beta_, float wheel_radius_,
							std::string child_id_, std::string frame_id_);
	~WM_Odometry_Feedback();

private:

	/* x axis distance,in meter, between wheel axis and the robot's centroid */
	float alpha;

	/* y axis distance, in meter, between wheel radial median and the robot's centroid */
	float beta;

	/* wheel radius, in meter */
	float wheel_radius;

	std::string child_frame_id;

	std::string frame_id;

	ros::NodeHandle nh_;

	

	nav_msgs::Odometry odom;

	ros::Time prev_time;

	/* Inverse Jacobian matrix
		{{0.25, 0.25, 0.25, 0.25},
		{-0.25, 0.25, 0.25, -0.25},
		{-0.25*(alpha + beta), 0.25*(alpha + beta), -0.25*(alpha + beta), 0.25*(alpha + beta)}}; */
	/* inv_jacobian_yaw is fully initialized in the class constructor */
	float inv_jacobian_x[4]; // {0.25, 0.25, 0.25, 0.25};
	float inv_jacobian_y[4]; // {-0.25, 0.25, 0.25, -0.25};
	float inv_jacobian_yaw[4]; //{-0.25*(alpha+beta), 0.25(alpha+beta), -0.25(alpha+beta), 0.25(alpha+beta)};

	/* number of element in inv_mat_* */
	int inv_jacobian_size; // 4

	void callback(const roboteq_msgs::Feedback&, const roboteq_msgs::Feedback&, const roboteq_msgs::Feedback&, const roboteq_msgs::Feedback&);

	tf2_ros::TransformBroadcaster odom_broadcaster;

	message_filters::Subscriber<roboteq_msgs::Feedback> FLW_fb;
	message_filters::Subscriber<roboteq_msgs::Feedback> FRW_fb; //(nh_, "roboteq_driver_FRW/feedback", 1);
	message_filters::Subscriber<roboteq_msgs::Feedback> RLW_fb; //(nh_, "roboteq_driver_RLW/feedback", 1);
	message_filters::Subscriber<roboteq_msgs::Feedback> RRW_fb; //(nh_, "roboteq_driver_RRW/feedback", 1);

	ros::Publisher odom_pub;
	std::vector<message_filters::Subscriber<roboteq_msgs::Feedback>> test;
	
	message_filters::Synchronizer<MySyncPolicy> sync;//(MySyncPolicy(10), FLW_fb,FRW_fb, RLW_fb, RRW_fb);


};

#endif /* WM_ODOMETRY_FEEDBACK_H_ */
