; Auto-generated. Do not edit!


(cl:in-package cob_people_detection-msg)


;//! \htmlinclude addDataGoal.msg.html

(cl:defclass <addDataGoal> (roslisp-msg-protocol:ros-message)
  ((label
    :reader label
    :initarg :label
    :type cl:string
    :initform "")
   (capture_mode
    :reader capture_mode
    :initarg :capture_mode
    :type cl:integer
    :initform 0)
   (continuous_mode_images_to_capture
    :reader continuous_mode_images_to_capture
    :initarg :continuous_mode_images_to_capture
    :type cl:integer
    :initform 0)
   (continuous_mode_delay
    :reader continuous_mode_delay
    :initarg :continuous_mode_delay
    :type cl:float
    :initform 0.0))
)

(cl:defclass addDataGoal (<addDataGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addDataGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addDataGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cob_people_detection-msg:<addDataGoal> is deprecated: use cob_people_detection-msg:addDataGoal instead.")))

(cl:ensure-generic-function 'label-val :lambda-list '(m))
(cl:defmethod label-val ((m <addDataGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-msg:label-val is deprecated.  Use cob_people_detection-msg:label instead.")
  (label m))

(cl:ensure-generic-function 'capture_mode-val :lambda-list '(m))
(cl:defmethod capture_mode-val ((m <addDataGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-msg:capture_mode-val is deprecated.  Use cob_people_detection-msg:capture_mode instead.")
  (capture_mode m))

(cl:ensure-generic-function 'continuous_mode_images_to_capture-val :lambda-list '(m))
(cl:defmethod continuous_mode_images_to_capture-val ((m <addDataGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-msg:continuous_mode_images_to_capture-val is deprecated.  Use cob_people_detection-msg:continuous_mode_images_to_capture instead.")
  (continuous_mode_images_to_capture m))

(cl:ensure-generic-function 'continuous_mode_delay-val :lambda-list '(m))
(cl:defmethod continuous_mode_delay-val ((m <addDataGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-msg:continuous_mode_delay-val is deprecated.  Use cob_people_detection-msg:continuous_mode_delay instead.")
  (continuous_mode_delay m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addDataGoal>) ostream)
  "Serializes a message object of type '<addDataGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'label))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'label))
  (cl:let* ((signed (cl:slot-value msg 'capture_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'continuous_mode_images_to_capture)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'continuous_mode_delay))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addDataGoal>) istream)
  "Deserializes a message object of type '<addDataGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'label) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'label) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'capture_mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'continuous_mode_images_to_capture) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'continuous_mode_delay) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addDataGoal>)))
  "Returns string type for a message object of type '<addDataGoal>"
  "cob_people_detection/addDataGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addDataGoal)))
  "Returns string type for a message object of type 'addDataGoal"
  "cob_people_detection/addDataGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addDataGoal>)))
  "Returns md5sum for a message object of type '<addDataGoal>"
  "2c9c666c7dd8f1cd1885c5fee48c91b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addDataGoal)))
  "Returns md5sum for a message object of type 'addDataGoal"
  "2c9c666c7dd8f1cd1885c5fee48c91b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addDataGoal>)))
  "Returns full string definition for message of type '<addDataGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Adds data to the training database~%#~%# goal message~%string label				# a label for the data which shall be added~%int32 capture_mode			# mode of data capture: 0=manual (i.e. initiate data capture with service messages), 1=continuous~%int32 continuous_mode_images_to_capture	# if the continuous mode is selected this number specifies how many images shall be captured~%float32 continuous_mode_delay		# if the continuous mode is selected this number specifies the delay time between the recording of two successive images (in seconds)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addDataGoal)))
  "Returns full string definition for message of type 'addDataGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Adds data to the training database~%#~%# goal message~%string label				# a label for the data which shall be added~%int32 capture_mode			# mode of data capture: 0=manual (i.e. initiate data capture with service messages), 1=continuous~%int32 continuous_mode_images_to_capture	# if the continuous mode is selected this number specifies how many images shall be captured~%float32 continuous_mode_delay		# if the continuous mode is selected this number specifies the delay time between the recording of two successive images (in seconds)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addDataGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'label))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addDataGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'addDataGoal
    (cl:cons ':label (label msg))
    (cl:cons ':capture_mode (capture_mode msg))
    (cl:cons ':continuous_mode_images_to_capture (continuous_mode_images_to_capture msg))
    (cl:cons ':continuous_mode_delay (continuous_mode_delay msg))
))
