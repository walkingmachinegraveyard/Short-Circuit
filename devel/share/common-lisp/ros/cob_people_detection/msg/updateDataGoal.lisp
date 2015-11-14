; Auto-generated. Do not edit!


(cl:in-package cob_people_detection-msg)


;//! \htmlinclude updateDataGoal.msg.html

(cl:defclass <updateDataGoal> (roslisp-msg-protocol:ros-message)
  ((update_mode
    :reader update_mode
    :initarg :update_mode
    :type cl:integer
    :initform 0)
   (update_index
    :reader update_index
    :initarg :update_index
    :type cl:integer
    :initform 0)
   (old_label
    :reader old_label
    :initarg :old_label
    :type cl:string
    :initform "")
   (new_label
    :reader new_label
    :initarg :new_label
    :type cl:string
    :initform ""))
)

(cl:defclass updateDataGoal (<updateDataGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <updateDataGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'updateDataGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cob_people_detection-msg:<updateDataGoal> is deprecated: use cob_people_detection-msg:updateDataGoal instead.")))

(cl:ensure-generic-function 'update_mode-val :lambda-list '(m))
(cl:defmethod update_mode-val ((m <updateDataGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-msg:update_mode-val is deprecated.  Use cob_people_detection-msg:update_mode instead.")
  (update_mode m))

(cl:ensure-generic-function 'update_index-val :lambda-list '(m))
(cl:defmethod update_index-val ((m <updateDataGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-msg:update_index-val is deprecated.  Use cob_people_detection-msg:update_index instead.")
  (update_index m))

(cl:ensure-generic-function 'old_label-val :lambda-list '(m))
(cl:defmethod old_label-val ((m <updateDataGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-msg:old_label-val is deprecated.  Use cob_people_detection-msg:old_label instead.")
  (old_label m))

(cl:ensure-generic-function 'new_label-val :lambda-list '(m))
(cl:defmethod new_label-val ((m <updateDataGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cob_people_detection-msg:new_label-val is deprecated.  Use cob_people_detection-msg:new_label instead.")
  (new_label m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <updateDataGoal>) ostream)
  "Serializes a message object of type '<updateDataGoal>"
  (cl:let* ((signed (cl:slot-value msg 'update_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'update_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'old_label))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'old_label))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'new_label))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'new_label))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <updateDataGoal>) istream)
  "Deserializes a message object of type '<updateDataGoal>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'update_mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'update_index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'old_label) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'old_label) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'new_label) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'new_label) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<updateDataGoal>)))
  "Returns string type for a message object of type '<updateDataGoal>"
  "cob_people_detection/updateDataGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'updateDataGoal)))
  "Returns string type for a message object of type 'updateDataGoal"
  "cob_people_detection/updateDataGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<updateDataGoal>)))
  "Returns md5sum for a message object of type '<updateDataGoal>"
  "d34a17444815de8f9d0fe51faa3bd9da")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'updateDataGoal)))
  "Returns md5sum for a message object of type 'updateDataGoal"
  "d34a17444815de8f9d0fe51faa3bd9da")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<updateDataGoal>)))
  "Returns full string definition for message of type '<updateDataGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Updates data in the training database~%#~%# goal message~%int32 update_mode			# update the label with new_label either for 1=one image given the update_index, 2=all entries labeled with old_label~%int32 update_index			# the database entry with this index number shall be updated with a new label~%string old_label			# all database entries carrying this label are to be updated with new_label~%string new_label			# the new label that is supposed to replace the old one~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'updateDataGoal)))
  "Returns full string definition for message of type 'updateDataGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Updates data in the training database~%#~%# goal message~%int32 update_mode			# update the label with new_label either for 1=one image given the update_index, 2=all entries labeled with old_label~%int32 update_index			# the database entry with this index number shall be updated with a new label~%string old_label			# all database entries carrying this label are to be updated with new_label~%string new_label			# the new label that is supposed to replace the old one~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <updateDataGoal>))
  (cl:+ 0
     4
     4
     4 (cl:length (cl:slot-value msg 'old_label))
     4 (cl:length (cl:slot-value msg 'new_label))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <updateDataGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'updateDataGoal
    (cl:cons ':update_mode (update_mode msg))
    (cl:cons ':update_index (update_index msg))
    (cl:cons ':old_label (old_label msg))
    (cl:cons ':new_label (new_label msg))
))
