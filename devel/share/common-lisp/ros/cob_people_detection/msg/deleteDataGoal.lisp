; Auto-generated. Do not edit!


(cl:in-package cob_people_detection-msg)


;//! \htmlinclude deleteDataGoal.msg.html

(cl:defclass <deleteDataGoal> (roslisp-msg-protocol:ros-message)
  ((delete_mode
    :reader delete_mode
    :initarg :delete_mode
    :type cl:integer
    :initform 0)
   (delete_index
    :reader delete_index
    :initarg :delete_index
    :type cl:integer
    :initform 0)
   (label
    :reader label
    :initarg :label
    :type cl:string
    :initform ""))
)

(cl:defclass deleteDataGoal (<deleteDataGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <deleteDataGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'deleteDataGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cob_people_detection-msg:<deleteDataGoal> is deprecated: use cob_people_detection-msg:deleteDataGoal instead.")))

(cl:ensure-generic-function 'delete_mode-val :lambda-list '(m))
(cl:defmethod delete_mode-val ((m <deleteDataGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-msg:delete_mode-val is deprecated.  Use cob_people_detection-msg:delete_mode instead.")
  (delete_mode m))

(cl:ensure-generic-function 'delete_index-val :lambda-list '(m))
(cl:defmethod delete_index-val ((m <deleteDataGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-msg:delete_index-val is deprecated.  Use cob_people_detection-msg:delete_index instead.")
  (delete_index m))

(cl:ensure-generic-function 'label-val :lambda-list '(m))
(cl:defmethod label-val ((m <deleteDataGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-msg:label-val is deprecated.  Use cob_people_detection-msg:label instead.")
  (label m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <deleteDataGoal>) ostream)
  "Serializes a message object of type '<deleteDataGoal>"
  (cl:let* ((signed (cl:slot-value msg 'delete_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'delete_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'label))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'label))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <deleteDataGoal>) istream)
  "Deserializes a message object of type '<deleteDataGoal>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'delete_mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'delete_index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'label) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'label) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<deleteDataGoal>)))
  "Returns string type for a message object of type '<deleteDataGoal>"
  "cob_people_detection/deleteDataGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'deleteDataGoal)))
  "Returns string type for a message object of type 'deleteDataGoal"
  "cob_people_detection/deleteDataGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<deleteDataGoal>)))
  "Returns md5sum for a message object of type '<deleteDataGoal>"
  "699fefe29c3cb75fdf58d155b2fb38f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'deleteDataGoal)))
  "Returns md5sum for a message object of type 'deleteDataGoal"
  "699fefe29c3cb75fdf58d155b2fb38f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<deleteDataGoal>)))
  "Returns full string definition for message of type '<deleteDataGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Deletes specific data in the training database~%#~%# goal message~%int32 delete_mode			# delete database entries in one of the following ways: 1=one entry given the delete_index, 2=all entries labeled with label~%int32 delete_index			# the database entry with this index number shall be deleted~%string label				# all database entries carrying this label are to be deleted~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'deleteDataGoal)))
  "Returns full string definition for message of type 'deleteDataGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Deletes specific data in the training database~%#~%# goal message~%int32 delete_mode			# delete database entries in one of the following ways: 1=one entry given the delete_index, 2=all entries labeled with label~%int32 delete_index			# the database entry with this index number shall be deleted~%string label				# all database entries carrying this label are to be deleted~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <deleteDataGoal>))
  (cl:+ 0
     4
     4
     4 (cl:length (cl:slot-value msg 'label))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <deleteDataGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'deleteDataGoal
    (cl:cons ':delete_mode (delete_mode msg))
    (cl:cons ':delete_index (delete_index msg))
    (cl:cons ':label (label msg))
))
