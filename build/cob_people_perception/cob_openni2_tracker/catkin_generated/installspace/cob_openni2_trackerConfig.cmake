# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(cob_openni2_tracker_CONFIG_INCLUDED)
  return()
endif()
set(cob_openni2_tracker_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("FALSE" STREQUAL "TRUE")
  set(cob_openni2_tracker_SOURCE_PREFIX /home/wm/Short-Circuit/src/cob_people_perception/cob_openni2_tracker)
  set(cob_openni2_tracker_DEVEL_PREFIX /home/wm/Short-Circuit/devel)
  set(cob_openni2_tracker_INSTALL_PREFIX "")
  set(cob_openni2_tracker_PREFIX ${cob_openni2_tracker_DEVEL_PREFIX})
else()
  set(cob_openni2_tracker_SOURCE_PREFIX "")
  set(cob_openni2_tracker_DEVEL_PREFIX "")
  set(cob_openni2_tracker_INSTALL_PREFIX /home/wm/Short-Circuit/install)
  set(cob_openni2_tracker_PREFIX ${cob_openni2_tracker_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'cob_openni2_tracker' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(cob_openni2_tracker_FOUND_CATKIN_PROJECT TRUE)

if(NOT "include;/usr/local/include/opencv;/usr/local/include;/usr/include/eigen3;/opt/ros/indigo/include " STREQUAL " ")
  set(cob_openni2_tracker_INCLUDE_DIRS "")
  set(_include_dirs "include;/usr/local/include/opencv;/usr/local/include;/usr/include/eigen3;/opt/ros/indigo/include")
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${cob_openni2_tracker_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'cob_openni2_tracker' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  Ask the maintainer 'Richard Bormann <richard.bormann@ipa.fraunhofer.de>' to fix it.")
      endif()
    else()
      message(FATAL_ERROR "Project 'cob_openni2_tracker' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/wm/Short-Circuit/install/${idir}'.  Ask the maintainer 'Richard Bormann <richard.bormann@ipa.fraunhofer.de>' to fix it.")
    endif()
    _list_append_unique(cob_openni2_tracker_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "/usr/local/lib/libopencv_videostab.so.2.4.11;/usr/local/lib/libopencv_video.so.2.4.11;/usr/local/lib/libopencv_superres.so.2.4.11;/usr/local/lib/libopencv_stitching.so.2.4.11;/usr/local/lib/libopencv_photo.so.2.4.11;/usr/local/lib/libopencv_ocl.so.2.4.11;/usr/local/lib/libopencv_objdetect.so.2.4.11;/usr/local/lib/libopencv_nonfree.so.2.4.11;/usr/local/lib/libopencv_ml.so.2.4.11;/usr/local/lib/libopencv_legacy.so.2.4.11;/usr/local/lib/libopencv_imgproc.so.2.4.11;/usr/local/lib/libopencv_highgui.so.2.4.11;/usr/local/lib/libopencv_gpu.so.2.4.11;/usr/local/lib/libopencv_flann.so.2.4.11;/usr/local/lib/libopencv_features2d.so.2.4.11;/usr/local/lib/libopencv_core.so.2.4.11;/usr/local/lib/libopencv_contrib.so.2.4.11;/usr/local/lib/libopencv_calib3d.so.2.4.11;/opt/ros/indigo/lib/liborocos-kdl.so.1.3.0")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND cob_openni2_tracker_LIBRARIES ${library})
  elseif(TARGET ${library})
    list(APPEND cob_openni2_tracker_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND cob_openni2_tracker_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/wm/Short-Circuit/install/lib;/home/wm/Short-Circuit/devel/lib;/opt/ros/indigo/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(cob_openni2_tracker_LIBRARY_DIRS ${lib_path})
      list(APPEND cob_openni2_tracker_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'cob_openni2_tracker'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND cob_openni2_tracker_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(cob_openni2_tracker_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${cob_openni2_tracker_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "geometry_msgs;sensor_msgs;visualization_msgs;cob_perception_msgs;image_transport;cv_bridge;std_msgs;roscpp;roslib;tf;libnite2;nodelet;pcl_ros;message_runtime;nodelet;pcl_ros")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 cob_openni2_tracker_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${cob_openni2_tracker_dep}_FOUND)
      find_package(${cob_openni2_tracker_dep} REQUIRED)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${cob_openni2_tracker_dep} REQUIRED ${depend_list})
  endif()
  _list_append_unique(cob_openni2_tracker_INCLUDE_DIRS ${${cob_openni2_tracker_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(cob_openni2_tracker_LIBRARIES ${cob_openni2_tracker_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${cob_openni2_tracker_dep}_LIBRARIES})
  _list_append_deduplicate(cob_openni2_tracker_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(cob_openni2_tracker_LIBRARIES ${cob_openni2_tracker_LIBRARIES})

  _list_append_unique(cob_openni2_tracker_LIBRARY_DIRS ${${cob_openni2_tracker_dep}_LIBRARY_DIRS})
  list(APPEND cob_openni2_tracker_EXPORTED_TARGETS ${${cob_openni2_tracker_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${cob_openni2_tracker_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
