let
  common = import ../common;
in
[
  ./imgview
  ./launcher
  ./mpv
] ++ common
