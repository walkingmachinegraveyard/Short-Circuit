FILE(REMOVE_RECURSE
  "CMakeFiles/canlib_"
  "CMakeFiles/canlib_-complete"
  "src/canlib_-stamp/canlib_-install"
  "src/canlib_-stamp/canlib_-mkdir"
  "src/canlib_-stamp/canlib_-download"
  "src/canlib_-stamp/canlib_-update"
  "src/canlib_-stamp/canlib_-patch"
  "src/canlib_-stamp/canlib_-configure"
  "src/canlib_-stamp/canlib_-build"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/canlib_.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
