FILE(REMOVE_RECURSE
  "/home/wm/Short-Circuit/devel/lib/libcanlib.pdb"
  "/home/wm/Short-Circuit/devel/lib/libcanlib.so"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/canlib.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
