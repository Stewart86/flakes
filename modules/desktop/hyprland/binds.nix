{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod, Return, exec, kitty"
      "$mod SHIFT, Return, exec, kitty --class termfloat"
      "$mod, Q, killactive"
      "$mod SHIFT, Q, exit"
      "$mod SHIFT, Space, togglefloating"
      "$mod,F,fullscreen"
      "$mod,Y,pin"
      "$mod, P, pseudo"
      "$mod, simicolon, layoutmsg, togglesplit"
      "$mod, G, togglegroup"
      "$mod, Tab, changegroupactive, f"
      "$mod SHIFT, G,exec,hyprctl --batch 'keyword general:gaps_out 20;keyword general:gaps_in 5'"
      "$mod, G,exec,hyprctl --batch 'keyword general:gaps_out 0;keyword general:gaps_in 0'"

      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod, H, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, K, movefocus, u"
      "$mod, J, movefocus, d"

      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"
      "$mod, ], workspace, +1"
      "$mod, [, workspace, -1"

      "$mod, period, workspace, e+1"
      "$mod, comma, workspace,e-1"

      "$mod, minus, movetoworkspace,special"
      "$mod, equal, togglespecialworkspace"

      "$mod SHIFT,left ,movewindow, l"
      "$mod SHIFT,right ,movewindow, r"
      "$mod SHIFT,up ,movewindow, u"
      "$mod SHIFT,down ,movewindow, d"
      "$mod SHIFT,H ,movewindow, l"
      "$mod SHIFT,L ,movewindow, r"
      "$mod SHIFT,K ,movewindow, u"
      "$mod SHIFT,J ,movewindow, d"

      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
      "$mod SHIFT, left, movetoworkspace, -1"
      "$mod SHIFT, right, movetoworkspace, +1"

      "$mod CTRL, 1, movetoworkspacesilent, 1"
      "$mod CTRL, 2, movetoworkspacesilent, 2"
      "$mod CTRL, 3, movetoworkspacesilent, 3"
      "$mod CTRL, 4, movetoworkspacesilent, 4"
      "$mod CTRL, 5, movetoworkspacesilent, 5"
      "$mod CTRL, 6, movetoworkspacesilent, 6"
      "$mod CTRL, 7, movetoworkspacesilent, 7"
      "$mod CTRL, 8, movetoworkspacesilent, 8"
      "$mod CTRL, 9, movetoworkspacesilent, 9"
      "$mod CTRL, 0, movetoworkspacesilent, 10"

      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"

      "$mod,slash,workspace,previous"

      "$mod SHIFT,B,exec,brave --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime"
      "$mod SHIFT,S,exec,slack --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime"
      "$mod SHIFT,T,exec,telegram-desktop"
      "$mod SHIFT,D,exec,webcord --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime"
      "$mod SHIFT,W,exec,whatsapp-for-linux"
      "$mod SHIFT,E,exec,evolution"
      "$mod SHIFT,M,exec,youtube-music"

      "$mod,X,exec,myswaylock"

      "$mod,A,exec, grimblast_anotate"

      ", Super_L,exec, pkill rofi || ~/.config/rofi/launcher.sh"
      "$mod, Super_L,exec, bash ~/.config/rofi/powermenu.sh"
      "$mod,V,exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

      # open notifiacation center
      "$mod, N,exec, swaync-client -t"

      ", XF86AudioRaiseVolume,exec, pamixer -i 5"
      ", XF86AudioLowerVolume,exec, pamixer -d 5"
      ", XF86AudioMute,exec, pamixer -t"
      ", XF86AudioMicMute,exec, pamixer --default-source -t"
      ", XF86MonBrightnessUp,exec, light -A 5"
      ", XF86MonBrightnessDown, exec, light -U 5"
      ", XF86AudioPlay,exec, mpc -q toggle "
      ", XF86AudioNext,exec, mpc -q next "
      ", XF86AudioPrev,exec, mpc -q prev"

      "$mod,O,exec,killall -SIGUSR1 .waybar-wrapped"

      "CTRL SHIFT, left, resizeactive,-15 0"
      "CTRL SHIFT, right, resizeactive,15 0"
      "CTRL SHIFT, up, resizeactive,0 -15"
      "CTRL SHIFT, down, resizeactive,0 15"
    ];

    binde = [
      "CTRL SHIFT, l, resizeactive, 15 0"
      "CTRL SHIFT, h, resizeactive,-15 0"
      "CTRL SHIFT, k, resizeactive, 0 -15"
      "CTRL SHIFT, j, resizeactive, 0 15"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
