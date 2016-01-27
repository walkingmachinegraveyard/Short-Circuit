#!/usr/bin/env python

import pyttsx
import rospy
from std_msgs.msg import String


class wm_tts:
    def __init__(self):
        # get parameters
        self.engine = pyttsx.init()
        rate = rospy.get_param('rate', 150)
        self.engine.setProperty('rate', rate)
        self.engine.setProperty('volume', 0.5)

        self.sub = rospy.Subscriber('output', String, self.callback)

    def callback(self, msg):

        self.engine.say(msg)
        self.engine.runAndWait()

if __name__ == '__main__':

    try:
        rospy.init_node('wm_tts_node')

        wm_tts()

        rospy.spin()

    except rospy.ROSInterruptException:
        pass











