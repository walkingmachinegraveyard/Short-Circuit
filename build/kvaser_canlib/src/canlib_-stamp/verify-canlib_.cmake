set(file "/home/wm/Short-Circuit/build/kvaser_canlib/download/linuxcan.tar.gz")
message(STATUS "verifying file...
     file='${file}'")
set(expect_value "7d6d97266fd370d4233cbc1e0a917e82")
file(MD5 "${file}" actual_value)
if("${actual_value}" STREQUAL "${expect_value}")
  message(STATUS "verifying file... done")
else()
  message(FATAL_ERROR "error: MD5 hash of
  ${file}
does not match expected value
  expected: ${expect_value}
    actual: ${actual_value}
")
endif()
