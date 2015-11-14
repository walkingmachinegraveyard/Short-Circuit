; Auto-generated. Do not edit!


(cl:in-package cob_people_detection-srv)


;//! \htmlinclude finishRecording-request.msg.html

(cl:defclass <finishRecording-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass finishRecording-request (<finishRecording-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <finishRecording-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'finishRecording-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cob_people_detection-srv:<finishRecording-request> is deprecated: use cob_people_detection-srv:finishRecording-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <finishRecording-request>) ostream)
  "Serializes a message object of type '<finishRecording-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <finishRecording-request>) istream)
  "Deserializes a message object of type '<finishRecording-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<finishRecording-request>)))
  "Returns string type for a service object of type '<finishRecording-request>"
  "cob_people_detection/finishRecordingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'finishRecording-request)))
  "Returns string type for a service object of type 'finishRecording-request"
  "cob_people_detection/finishRecordingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<finishRecording-request>)))
  "Returns md5sum for a message object of type '<finishRecording-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'finishRecording-request)))
  "Returns md5sum for a message object of type 'finishRecording-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<finishRecording-request>)))
  "Returns full string definition for message of type '<finishRecording-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'finishRecording-request)))
  "Returns full string definition for message of type 'finishRecording-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <finishRecording-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <finishRecording-request>))
  "Converts a ROS message object to a list"
  (cl:list 'finishRecording-request
))
;//! \htmlinclude finishRecording-response.msg.html

(cl:defclass <finishRecording-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass finishRecording-response (<finishRecording-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <finishRecording-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'finishRecording-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cob_people_detection-srv:<finishRecording-response> is deprecated: use cob_people_detection-srv:finishRecording-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <finishRecording-response>) ostream)
  "Serializes a message object of type '<finishRecording-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <finishRecording-response>) istream)
  "Deserializes a message object of type '<finishRecording-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<finishRecording-response>)))
  "Returns string type for a service object of type '<finishRecording-response>"
  "cob_people_detection/finishRecordingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'finishRecording-response)))
  "Returns string type for a service object of type 'finishRecording-response"
  "cob_people_detection/finishRecordingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<finishRecording-response>)))
  "Returns md5sum for a message object of type '<finishRecording-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'finishRecording-response)))
  "Returns md5sum for a message object of type 'finishRecording-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<finishRecording-response>)))
  "Returns full string definition for message of type '<finishRecording-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'finishRecording-response)))
  "Returns full string definition for message of type 'finishRecording-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <finishRecording-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <finishRecording-response>))
  "Converts a ROS message object to a list"
  (cl:list 'finishRecording-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'finishRecording)))
  'finishRecording-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'finishRecording)))
  'finishRecording-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'finishRecording)))
  "Returns string type for a service object of type '<finishRecording>"
  "cob_people_detection/finishRecording")