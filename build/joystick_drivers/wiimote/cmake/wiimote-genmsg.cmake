# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "wiimote: 3 messages, 0 services")

set(MSG_I_FLAGS "-Iwiimote:/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(wiimote_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/TimedSwitch.msg" NAME_WE)
add_custom_target(_wiimote_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wiimote" "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/TimedSwitch.msg" ""
)

get_filename_component(_filename "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/IrSourceInfo.msg" NAME_WE)
add_custom_target(_wiimote_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wiimote" "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/IrSourceInfo.msg" ""
)

get_filename_component(_filename "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/State.msg" NAME_WE)
add_custom_target(_wiimote_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wiimote" "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/State.msg" "geometry_msgs/Vector3:std_msgs/Header:wiimote/IrSourceInfo"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(wiimote
  "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/TimedSwitch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wiimote
)
_generate_msg_cpp(wiimote
  "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wiimote
)
_generate_msg_cpp(wiimote
  "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wiimote
)

### Generating Services

### Generating Module File
_generate_module_cpp(wiimote
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wiimote
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(wiimote_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(wiimote_generate_messages wiimote_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/TimedSwitch.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_cpp _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/IrSourceInfo.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_cpp _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/State.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_cpp _wiimote_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wiimote_gencpp)
add_dependencies(wiimote_gencpp wiimote_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wiimote_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(wiimote
  "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/TimedSwitch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wiimote
)
_generate_msg_lisp(wiimote
  "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wiimote
)
_generate_msg_lisp(wiimote
  "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wiimote
)

### Generating Services

### Generating Module File
_generate_module_lisp(wiimote
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wiimote
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(wiimote_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(wiimote_generate_messages wiimote_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/TimedSwitch.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_lisp _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/IrSourceInfo.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_lisp _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/State.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_lisp _wiimote_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wiimote_genlisp)
add_dependencies(wiimote_genlisp wiimote_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wiimote_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(wiimote
  "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/TimedSwitch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote
)
_generate_msg_py(wiimote
  "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote
)
_generate_msg_py(wiimote
  "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote
)

### Generating Services

### Generating Module File
_generate_module_py(wiimote
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(wiimote_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(wiimote_generate_messages wiimote_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/TimedSwitch.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_py _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/IrSourceInfo.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_py _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wm/Short-Circuit/src/joystick_drivers/wiimote/msg/State.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_py _wiimote_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wiimote_genpy)
add_dependencies(wiimote_genpy wiimote_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wiimote_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wiimote)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wiimote
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(wiimote_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(wiimote_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(wiimote_generate_messages_cpp sensor_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wiimote)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wiimote
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(wiimote_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(wiimote_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(wiimote_generate_messages_lisp sensor_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote/.+/__init__.pyc?$"
  )
endif()
add_dependencies(wiimote_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(wiimote_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(wiimote_generate_messages_py sensor_msgs_generate_messages_py)
