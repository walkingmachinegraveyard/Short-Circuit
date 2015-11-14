; Auto-generated. Do not edit!


(cl:in-package cob_people_detection-srv)


;//! \htmlinclude recognitionTrigger-request.msg.html

(cl:defclass <recognitionTrigger-request> (roslisp-msg-protocol:ros-message)
  ((target_frame_rate
    :reader target_frame_rate
    :initarg :target_frame_rate
    :type cl:float
    :initform 0.0))
)

(cl:defclass recognitionTrigger-request (<recognitionTrigger-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <recognitionTrigger-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'recognitionTrigger-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cob_people_detection-srv:<recognitionTrigger-request> is deprecated: use cob_people_detection-srv:recognitionTrigger-request instead.")))

(cl:ensure-generic-function 'target_frame_rate-val :lambda-list '(m))
(cl:defmethod target_frame_rate-val ((m <recognitionTrigger-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-srv:target_frame_rate-val is deprecated.  Use cob_people_detection-srv:target_frame_rate instead.")
  (target_frame_rate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <recognitionTrigger-request>) ostream)
  "Serializes a message object of type '<recognitionTrigger-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_frame_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <recognitionTrigger-request>) istream)
  "Deserializes a message object of type '<recognitionTrigger-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_frame_rate) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<recognitionTrigger-request>)))
  "Returns string type for a service object of type '<recognitionTrigger-request>"
  "cob_people_detection/recognitionTriggerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recognitionTrigger-request)))
  "Returns string type for a service object of type 'recognitionTrigger-request"
  "cob_people_detection/recognitionTriggerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<recognitionTrigger-request>)))
  "Returns md5sum for a message object of type '<recognitionTrigger-request>"
  "0fb2bbc7af64ffad2d27794be36bc198")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'recognitionTrigger-request)))
  "Returns md5sum for a message object of type 'recognitionTrigger-request"
  "0fb2bbc7af64ffad2d27794be36bc198")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<recognitionTrigger-request>)))
  "Returns full string definition for message of type '<recognitionTrigger-request>"
  (cl:format cl:nil "~%float32 target_frame_rate~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'recognitionTrigger-request)))
  "Returns full string definition for message of type 'recognitionTrigger-request"
  (cl:format cl:nil "~%float32 target_frame_rate~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <recognitionTrigger-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <recognitionTrigger-request>))
  "Converts a ROS message object to a list"
  (cl:list 'recognitionTrigger-request
    (cl:cons ':target_frame_rate (target_frame_rate msg))
))
;//! \htmlinclude recognitionTrigger-response.msg.html

(cl:defclass <recognitionTrigger-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass recognitionTrigger-response (<recognitionTrigger-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <recognitionTrigger-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'recognitionTrigger-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cob_people_detection-srv:<recognitionTrigger-response> is deprecated: use cob_people_detection-srv:recognitionTrigger-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <recognitionTrigger-response>) ostream)
  "Serializes a message object of type '<recognitionTrigger-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <recognitionTrigger-response>) istream)
  "Deserializes a message object of type '<recognitionTrigger-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<recognitionTrigger-response>)))
  "Returns string type for a service object of type '<recognitionTrigger-response>"
  "cob_people_detection/recognitionTriggerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recognitionTrigger-response)))
  "Returns string type for a service object of type 'recognitionTrigger-response"
  "cob_people_detection/recognitionTriggerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<recognitionTrigger-response>)))
  "Returns md5sum for a message object of type '<recognitionTrigger-response>"
  "0fb2bbc7af64ffad2d27794be36bc198")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'recognitionTrigger-response)))
  "Returns md5sum for a message object of type 'recognitionTrigger-response"
  "0fb2bbc7af64ffad2d27794be36bc198")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<recognitionTrigger-response>)))
  "Returns full string definition for message of type '<recognitionTrigger-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'recognitionTrigger-response)))
  "Returns full string definition for message of type 'recognitionTrigger-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <recognitionTrigger-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <recognitionTrigger-response>))
  "Converts a ROS message object to a list"
  (cl:list 'recognitionTrigger-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'recognitionTrigger)))
  'recognitionTrigger-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'recognitionTrigger)))
  'recognitionTrigger-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recognitionTrigger)))
  "Returns string type for a service object of type '<recognitionTrigger>"
  "cob_people_detection/recognitionTrigger")