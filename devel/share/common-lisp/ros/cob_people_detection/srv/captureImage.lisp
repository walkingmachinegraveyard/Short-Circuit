; Auto-generated. Do not edit!


(cl:in-package cob_people_detection-srv)


;//! \htmlinclude captureImage-request.msg.html

(cl:defclass <captureImage-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass captureImage-request (<captureImage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <captureImage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'captureImage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cob_people_detection-srv:<captureImage-request> is deprecated: use cob_people_detection-srv:captureImage-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <captureImage-request>) ostream)
  "Serializes a message object of type '<captureImage-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <captureImage-request>) istream)
  "Deserializes a message object of type '<captureImage-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<captureImage-request>)))
  "Returns string type for a service object of type '<captureImage-request>"
  "cob_people_detection/captureImageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'captureImage-request)))
  "Returns string type for a service object of type 'captureImage-request"
  "cob_people_detection/captureImageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<captureImage-request>)))
  "Returns md5sum for a message object of type '<captureImage-request>"
  "86d49773917fcd20b952a821d3a9e019")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'captureImage-request)))
  "Returns md5sum for a message object of type 'captureImage-request"
  "86d49773917fcd20b952a821d3a9e019")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<captureImage-request>)))
  "Returns full string definition for message of type '<captureImage-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'captureImage-request)))
  "Returns full string definition for message of type 'captureImage-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <captureImage-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <captureImage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'captureImage-request
))
;//! \htmlinclude captureImage-response.msg.html

(cl:defclass <captureImage-response> (roslisp-msg-protocol:ros-message)
  ((number_captured_images
    :reader number_captured_images
    :initarg :number_captured_images
    :type cl:integer
    :initform 0))
)

(cl:defclass captureImage-response (<captureImage-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <captureImage-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'captureImage-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cob_people_detection-srv:<captureImage-response> is deprecated: use cob_people_detection-srv:captureImage-response instead.")))

(cl:ensure-generic-function 'number_captured_images-val :lambda-list '(m))
(cl:defmethod number_captured_images-val ((m <captureImage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-srv:number_captured_images-val is deprecated.  Use cob_people_detection-srv:number_captured_images instead.")
  (number_captured_images m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <captureImage-response>) ostream)
  "Serializes a message object of type '<captureImage-response>"
  (cl:let* ((signed (cl:slot-value msg 'number_captured_images)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <captureImage-response>) istream)
  "Deserializes a message object of type '<captureImage-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'number_captured_images) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<captureImage-response>)))
  "Returns string type for a service object of type '<captureImage-response>"
  "cob_people_detection/captureImageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'captureImage-response)))
  "Returns string type for a service object of type 'captureImage-response"
  "cob_people_detection/captureImageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<captureImage-response>)))
  "Returns md5sum for a message object of type '<captureImage-response>"
  "86d49773917fcd20b952a821d3a9e019")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'captureImage-response)))
  "Returns md5sum for a message object of type 'captureImage-response"
  "86d49773917fcd20b952a821d3a9e019")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<captureImage-response>)))
  "Returns full string definition for message of type '<captureImage-response>"
  (cl:format cl:nil "~%int32 number_captured_images~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'captureImage-response)))
  "Returns full string definition for message of type 'captureImage-response"
  (cl:format cl:nil "~%int32 number_captured_images~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <captureImage-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <captureImage-response>))
  "Converts a ROS message object to a list"
  (cl:list 'captureImage-response
    (cl:cons ':number_captured_images (number_captured_images msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'captureImage)))
  'captureImage-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'captureImage)))
  'captureImage-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'captureImage)))
  "Returns string type for a service object of type '<captureImage>"
  "cob_people_detection/captureImage")