# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "people_msgs: 5 messages, 0 services")

set(MSG_I_FLAGS "-Ipeople_msgs:/home/wm/Short-Circuit/src/people/people_msgs/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(people_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurementArray.msg" NAME_WE)
add_custom_target(_people_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "people_msgs" "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurementArray.msg" "people_msgs/PositionMeasurement:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/People.msg" NAME_WE)
add_custom_target(_people_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "people_msgs" "/home/wm/Short-Circuit/src/people/people_msgs/msg/People.msg" "people_msgs/Person:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/PersonStamped.msg" NAME_WE)
add_custom_target(_people_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "people_msgs" "/home/wm/Short-Circuit/src/people/people_msgs/msg/PersonStamped.msg" "people_msgs/Person:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg" NAME_WE)
add_custom_target(_people_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "people_msgs" "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg" NAME_WE)
add_custom_target(_people_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "people_msgs" "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg" "std_msgs/Header:geometry_msgs/Point"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurementArray.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/people_msgs
)
_generate_msg_cpp(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/People.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/people_msgs
)
_generate_msg_cpp(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PersonStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/people_msgs
)
_generate_msg_cpp(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/people_msgs
)
_generate_msg_cpp(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/people_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(people_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/people_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(people_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(people_msgs_generate_messages people_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurementArray.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_cpp _people_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/People.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_cpp _people_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/PersonStamped.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_cpp _people_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_cpp _people_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_cpp _people_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(people_msgs_gencpp)
add_dependencies(people_msgs_gencpp people_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS people_msgs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurementArray.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/people_msgs
)
_generate_msg_lisp(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/People.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/people_msgs
)
_generate_msg_lisp(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PersonStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/people_msgs
)
_generate_msg_lisp(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/people_msgs
)
_generate_msg_lisp(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/people_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(people_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/people_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(people_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(people_msgs_generate_messages people_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurementArray.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_lisp _people_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/People.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_lisp _people_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/PersonStamped.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_lisp _people_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_lisp _people_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_lisp _people_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(people_msgs_genlisp)
add_dependencies(people_msgs_genlisp people_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS people_msgs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurementArray.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/people_msgs
)
_generate_msg_py(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/People.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/people_msgs
)
_generate_msg_py(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PersonStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/people_msgs
)
_generate_msg_py(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/people_msgs
)
_generate_msg_py(people_msgs
  "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/people_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(people_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/people_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(people_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(people_msgs_generate_messages people_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurementArray.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_py _people_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/People.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_py _people_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/PersonStamped.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_py _people_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/Person.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_py _people_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/people/people_msgs/msg/PositionMeasurement.msg" NAME_WE)
add_dependencies(people_msgs_generate_messages_py _people_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(people_msgs_genpy)
add_dependencies(people_msgs_genpy people_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS people_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/people_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/people_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(people_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(people_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/people_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/people_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(people_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(people_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/people_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/people_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/people_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(people_msgs_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(people_msgs_generate_messages_py std_msgs_generate_messages_py)
