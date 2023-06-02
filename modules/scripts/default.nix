{ pkgs, ... }:

let
  cava-internal = pkgs.writeShellScriptBin "cava-internal" ''
    cava -p ~/.config/cava/config1 | sed -u 's/;//g;s/0/ /g;s/1/▁/g;s/2/▂/g;s/3/▃/g;s/4/▄/g;s/5/▅/g;s/6/▆/g;s/7/▇/g;'
  '';
  grimblast_anotate = pkgs.writeShellScriptBin "grimblast_anotate" ''
    FILE=$(date "+%Y-%m-%d"T"%H:%M:%S").png
    grimblast --notify --cursor save area $HOME/Pictures/$FILE >> /dev/null 2>&1
    swappy -f $HOME/Pictures/$FILE
    rm $HOME/Pictures/$FILE
  '';
  myswaylock = pkgs.writeShellScriptBin "myswaylock" ''
    swaylock  \
           --screenshots \
           --clock \
           --indicator \
           --indicator-radius 100 \
           --indicator-thickness 7 \
           --effect-blur 7x5 \
           --effect-vignette 0.5:0.5 \
           --ring-color 3b4252 \
           --key-hl-color 880033 \
           --line-color 00000000 \
           --inside-color 00000088 \
           --separator-color 00000000 \
           --grace 2 \
           --fade-in 0.3
  '';
  launch_waybar = pkgs.writeShellScriptBin "launch_waybar" ''
    #!/bin/bash
    killall .waybar-wrapped
    waybar > /dev/null 2>&1 & 
  '';
in
{
  home.packages = [
    cava-internal
    grimblast_anotate
    myswaylock
    launch_waybar
  ];
}
