{ pkgs, user, ... }:

{
  environment.systemPackages = with pkgs; [
    waybar
  ];

  nixpkgs.overlays = [
    (final: prev: {
      waybar = prev.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        postPatch = (oldAttrs.postPatch or "") + ''
          sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp'';
      });
    })
  ];

  home-manager.users.${user} = {
    # Home-manager waybar config
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
      };
      style = builtins.readFile ./style.css;
      settings = [{
        "layer" = "top";
        "position" = "top";
        modules-left = [
          "custom/launcher"
          "wlr/workspaces"
          # "idle_inhibitor"
          "custom/wall"
          "mpd"
          "custom/cava-internal"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "pulseaudio"
          "backlight"
          "memory"
          "cpu"
          "disk"
          "temperature"
          "network"
          "battery"
          "custom/powermenu"
          "tray"
          "custom/notifications"
        ];
        "custom/launcher" = {
          "format" = " ";
          "on-click" = "pkill rofi || ~/.config/rofi/launcher.sh";
          "tooltip" = false;
        };
        "custom/wall" = {
          "on-click" = "wallpaper_random";
          "on-click-middle" = "default_wall";
          "on-click-right" = "killall dynamic_wallpaper || dynamic_wallpaper &";
          "format" = "󰠖";
          "tooltip" = false;
        };
        "custom/cava-internal" = {
          "exec" = "sleep 1s && cava-internal";
          "tooltip" = false;
        };
        "wlr/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
          "tooltip" = false;
        };
        "backlight" = {
          "device" = "intel_backlight";
          "on-scroll-up" = "light -A 5";
          "on-scroll-down" = "light -U 5";
          "format" = "{icon} {percent}%";
          "format-icons" = [ "󰃚" "󰃛" "󰃜" "󰃝" "󰃞" "󰃟" "󰃠" ];
        };
        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = " Muted";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "format-bluetooth" = "{icon} {volume}%";
          "format-bluetooth-muted" = "󰗿";
          "format-icons" = {
            "default" = [ "" "" "" ];
            "bluetooth" = "";
            "headphone" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = " ";
          };
          "states" = {
            "warning" = 85;
          };
          "on-click" = "pamixer -t";
          "on-click-right" = "pavucontrol";
          "tooltip" = false;
        };
        "battery" = {
          "interval" = 10;
          "states" = {
            "good" = 100;
            "warning" = 30;
            "critical" = 10;
          };
          "format" = "{icon} {capacity}%";
          "format-icons" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          "format-full" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "tooltip" = false;
        };
        "clock" = {
          "interval" = 60;
          "timezone" = "Asia/Singapore";
          "format" = " {:%d <small>%a</small> %H:%M}";
          "format-alt" = " {:%A %B %d %Y (%V) | %r}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "calendar-weeks-pos" = "right";
          "today-format" = "<span color='#f38ba8'><b><u>{}</u></b></span>";
          "format-calendar" = "<span color='#f2cdcd'><b>{}</b></span>";
          "format-calendar-weeks" = "<span color='#94e2d5'><b>W{:%U}</b></span>";
          "format-calendar-weekdays" = "<span color='#f9e2af'><b>{}</b></span>";
        };
        "memory" = {
          "interval" = 2;
          "format" = " {percentage}%";
          "states" = {
            "warning" = 85;
          };
          "on-click" = "kitty --title floating_btop sh -c 'btop'";
        };
        "cpu" = {
          "interval" = 2;
          "format" = "󰻠 {usage}%";
          "on-click" = "kitty --title floating_btop sh -c 'btop'";
        };
        "disk" = {
          "format" = " {percentage_used}%";
          "tooltip" = true;
          "on-click" = "kitty --title floating_btop sh -c 'btop'";
          "interval" = 2;

        };
        "mpd" = {
          "max-length" = 25;
          "format" = "<span foreground='#bb9af7'></span> {title}";
          "format-paused" = " {title}";
          "format-stopped" = "<span foreground='#bb9af7'></span>";
          "format-disconnected" = "";
          "on-click" = "mpc --quiet toggle";
          "on-click-right" = "mpc update; mpc ls | mpc add";
          "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp ";
          "on-scroll-up" = "mpc --quiet prev";
          "on-scroll-down" = "mpc --quiet next";
          "smooth-scrolling-threshold" = 5;
          "tooltip-format" = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
        };
        "network" = {
          "interval" = 1;
          "format-wifi" = "󰖩";
          "format-ethernet" = "󰌗";
          "format-linked" = "󰌗";
          # "format-wifi" = "󰖩 {essid}";
          # "format-ethernet" = "󰌗 {ifname} ({ipaddr})";
          # "format-linked" = "󰌗 {essid} (No IP)";
          "format-disconnected" = "󰌙";
          "tooltip" = false;
        };
        "temperature" = {
          "tooltip" = false;
          "format" = " {temperatureC}°C";
        };
        "hyprland/window" = {
          "format" = "{}";
          "separate-outputs" = true;
          "max-length" = 35;
        };
        "custom/notifications" = {
          "tooltip" = false;
          "format" = "{icon} ";
          "format-icons" = {
            "notification" = "<span foreground='red'><sup></sup></span>";
            "none" = "";
            "dnd-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-none" = "";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click" = "swaync-client -t -sw";
          "on-click-right" = "swaync-client -d -sw";
          "escape" = true;
        };
        "custom/powermenu" = {
          "format" = "";
          "on-click" = "pkill rofi || ~/.config/rofi/powermenu.sh";
          "tooltip" = false;
        };
        "tray" = {
          "icon-size" = 15;
          "spacing" = 15;
        };
      }];
    };
  };
}
