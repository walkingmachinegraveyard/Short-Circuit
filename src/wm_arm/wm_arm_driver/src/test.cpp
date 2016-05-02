/*
 * test.cpp
 *
 *  Created on: May 1, 2016
 *      Author: xhache
 */

#include "ros/ros.h"
#include "wm_arm_msgs/computePlan.h"


int main(int argc, char **argv)
{
	ros::init(argc, argv, "plan_test");

	ros::AsyncSpinner spinner(0);
	spinner.start();

	ros::NodeHandle nh;

	if (argc != 8)
	{
		ROS_ERROR("Invalid number of arguments");
		return -1;
	}

	bool timeout = ros::service::waitForService("/wm_arm_driver_node/compute_plan", 10);
	if (timeout)
	{
		ROS_INFO("Waiting for service timed out");
		return -1;
	}
	else
	{
		ROS_INFO("Service is available.");
		ros::ServiceClient client = nh.serviceClient<wm_arm_msgs::computePlan>("/wm_arm_driver_node/compute_plan");
		wm_arm_msgs::computePlan srv;
		srv.request.targetPose.position.x = atof(argv[0]);
		srv.request.targetPose.position.y = atof(argv[1]);
		srv.request.targetPose.position.z = atof(argv[2]);
		srv.request.targetPose.orientation.x = atof(argv[3]);
		srv.request.targetPose.orientation.y = atof(argv[4]);
		srv.request.targetPose.orientation.z = atof(argv[5]);
		srv.request.targetPose.orientation.w = atof(argv[6]);

		if (client.call(srv))
		{
			ROS_INFO("Request sent.");
			if (srv.response.planningResult == srv.response.PLANNING_SUCCESS)
			{
				ROS_INFO("Planning succeeded.");
				ROS_INFO("Trajectory contains %d points", srv.response.trajectory.joint_trajectory.points.size());
			}
			else
			{
				ROS_INFO("Planning failed.");
			}
		}
		else
		{
			ROS_ERROR("Service call failed.");
			return -1;
		}
	}
	return 0;
}

