# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "face_detector: 7 messages, 0 services")

set(MSG_I_FLAGS "-Iface_detector:/home/wm/Short-Circuit/devel/share/face_detector/msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg;-Ipeople_msgs:/home/wm/Short-Circuit/src/people/people_msgs/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(face_detector_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionFeedback.msg" NAME_WE)
add_custom_target(_face_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "face_detector" "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionFeedback.msg" "face_detector/FaceDetectorFeedback:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg" NAME_WE)
add_custom_target(_face_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "face_detector" "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg" ""
)

get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg" NAME_WE)
add_custom_target(_face_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "face_detector" "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg" ""
)

get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorAction.msg" NAME_WE)
add_custom_target(_face_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "face_detector" "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorAction.msg" "face_detector/FaceDetectorGoal:geometry_msgs/Point:face_detector/FaceDetectorActionFeedback:face_detector/FaceDetectorFeedback:actionlib_msgs/GoalStatus:face_detector/FaceDetectorActionResult:face_detector/FaceDetectorResult:people_msgs/PositionMeasurement:std_msgs/Header:face_detector/FaceDetectorActionGoal:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionGoal.msg" NAME_WE)
add_custom_target(_face_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "face_detector" "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionGoal.msg" "actionlib_msgs/GoalID:std_msgs/Header:face_detector/FaceDetectorGoal"
)

get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionResult.msg" NAME_WE)
add_custom_target(_face_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "face_detector" "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionResult.msg" "face_detector/FaceDetectorResult:geometry_msgs/Point:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:people_msgs/PositionMeasurement:std_msgs/Header"
)

get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg" NAME_WE)
add_custom_target(_face_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "face_detector" "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg" "people_msgs/PositionMeasurement:std_msgs/Header:geometry_msgs/Point"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detector
)
_generate_msg_cpp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detector
)
_generate_msg_cpp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detector
)
_generate_msg_cpp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionFeedback.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionResult.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg;/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detector
)
_generate_msg_cpp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detector
)
_generate_msg_cpp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detector
)
_generate_msg_cpp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detector
)

### Generating Services

### Generating Module File
_generate_module_cpp(face_detector
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detector
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(face_detector_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(face_detector_generate_messages face_detector_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionFeedback.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_cpp _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_cpp _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_cpp _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorAction.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_cpp _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionGoal.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_cpp _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionResult.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_cpp _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_cpp _face_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(face_detector_gencpp)
add_dependencies(face_detector_gencpp face_detector_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS face_detector_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detector
)
_generate_msg_lisp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detector
)
_generate_msg_lisp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detector
)
_generate_msg_lisp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionFeedback.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionResult.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg;/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detector
)
_generate_msg_lisp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detector
)
_generate_msg_lisp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detector
)
_generate_msg_lisp(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detector
)

### Generating Services

### Generating Module File
_generate_module_lisp(face_detector
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detector
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(face_detector_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(face_detector_generate_messages face_detector_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionFeedback.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_lisp _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_lisp _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_lisp _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorAction.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_lisp _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionGoal.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_lisp _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionResult.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_lisp _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_lisp _face_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(face_detector_genlisp)
add_dependencies(face_detector_genlisp face_detector_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS face_detector_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detector
)
_generate_msg_py(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detector
)
_generate_msg_py(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detector
)
_generate_msg_py(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionFeedback.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionResult.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg;/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detector
)
_generate_msg_py(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detector
)
_generate_msg_py(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detector
)
_generate_msg_py(face_detector
  "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detector
)

### Generating Services

### Generating Module File
_generate_module_py(face_detector
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detector
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(face_detector_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(face_detector_generate_messages face_detector_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionFeedback.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_py _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorGoal.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_py _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorFeedback.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_py _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorAction.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_py _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionGoal.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_py _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorActionResult.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_py _face_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/devel/share/face_detector/msg/FaceDetectorResult.msg" NAME_WE)
add_dependencies(face_detector_generate_messages_py _face_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(face_detector_genpy)
add_dependencies(face_detector_genpy face_detector_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS face_detector_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_detector
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(face_detector_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
add_dependencies(face_detector_generate_messages_cpp people_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_detector
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(face_detector_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
add_dependencies(face_detector_generate_messages_lisp people_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detector)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detector\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_detector
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(face_detector_generate_messages_py actionlib_msgs_generate_messages_py)
add_dependencies(face_detector_generate_messages_py people_msgs_generate_messages_py)
