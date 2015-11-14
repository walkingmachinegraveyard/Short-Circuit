message(STATUS "downloading...
     src='http://www.kvaser.com/software/7330130980754/V5_3_0/linuxcan.tar.gz'
     dst='/home/wm/Short-Circuit/build/kvaser_canlib/download/linuxcan.tar.gz'
     timeout='none'")




file(DOWNLOAD
  "http://www.kvaser.com/software/7330130980754/V5_3_0/linuxcan.tar.gz"
  "/home/wm/Short-Circuit/build/kvaser_canlib/download/linuxcan.tar.gz"
  SHOW_PROGRESS
  EXPECTED_HASH;MD5=7d6d97266fd370d4233cbc1e0a917e82
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'http://www.kvaser.com/software/7330130980754/V5_3_0/linuxcan.tar.gz' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
