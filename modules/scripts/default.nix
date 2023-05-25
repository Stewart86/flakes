{ pkgs, ... }:

let
  cava-internal = pkgs.writeShellScriptBin "cava-internal" ''
    cava -p ~/.config/cava/config1 | sed -u 's/;//g;s/0/ /g;s/1/▁/g;s/2/▂/g;s/3/▃/g;s/4/▄/g;s/5/▅/g;s/6/▆/g;s/7/▇/g;'
  '';
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    killall dynamic_wallpaper
    swww img $(fd . ~/Pictures/wallpapers/ -t file | shuf -n1) --transition-type random || swww init 
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
  dynamic_wallpaper = pkgs.writeShellScriptBin "dynamic_wallpaper" ''
    swww img $(fd . ~/Pictures/wallpapers/ -t file | shuf -n1) --transition-type random
    OLD_PID=$!
    while true; do
        sleep 120
    swww img $(fd . ~/Pictures/wallpapers/ -t file | shuf -n1) --transition-type random
        NEXT_PID=$!
        sleep 5
        kill $OLD_PID
        OLD_PID=$NEXT_PID
    done
  '';
  default_wall = pkgs.writeShellScriptBin "default_wall" ''
    killall dynamic_wallpaper
    swww img "${../theme/catppuccin-dark/common/wall/firewatch.jpg}" --transition-type random ||
    swww init 
  '';
  launch_waybar = pkgs.writeShellScriptBin "launch_waybar" ''
    #!/bin/bash
    killall .waybar-wrapped
    waybar > /dev/null 2>&1 & 
  '';
  border_color = pkgs.writeShellScriptBin "border_color" ''
    function border_color {
      hyprctl keyword general:col.active_border rgb\(ffc0cb\) 
    }

    socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do border_color $line; done
  '';
in
{
  home.packages = [
    cava-internal
    wallpaper_random
    grimblast_anotate
    myswaylock
    dynamic_wallpaper
    default_wall
    launch_waybar
    border_color
    systemd_reset
  ];
}
