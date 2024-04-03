{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "ALT";

    monitor = [
      "desc:Dell Inc. DELL U2515H 01N564B301CL, highres, -2560x0, auto"
      "desc:Dell Inc. DELL U2719D 4MHFSS2, highres, 0x0, auto"
      "eDP-1, highres, 2560x0, auto"
    ];

    exec-once = [
      "launch_waybar &"
      "swaync &"
      "waypaper --restore"
      "nm-applet --indicator"
      "nextcloud --background"
      "blueman-applet"
      "fcitx5 --replace -d"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "hyprctl dispatch workspace 2"
    ];

    input = {
      kb_layout = "us";

      kb_options = "caps:escape";
      follow_mouse = 1;
      touchpad = {
        natural_scroll = true;
        clickfinger_behavior = true;
        tap-and-drag = true;
      };
    };

    binds = {
      workspace_back_and_forth = 1;
      allow_workspace_cycles = 1;
    };

    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;
      resize_on_border = true;
      hover_icon_on_border = true;

      "col.active_border" = "rgb(ffc0cb) rgb(24273A) rgb(24273A) rgb(ffc0cb) 45deg";
      "col.inactive_border" = "rgba(595959aa) rgba(595959aa) rgba(595959aa) rgba(595959aa) 45deg";
      bezier = "linear, 0.0, 0.0, 1.0, 1.0";
      animation = "borderangle, 1, 100, linear";

      layout = "dwindle";
    };

    dwindle = {
      no_gaps_when_only = false;
      force_split = 0;
      split_width_multiplier = 1.0;
      use_active_for_splits = true;
      pseudotile = true;
      preserve_split = true;
    };

    decoration = {
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      fullscreen_opacity = 1.0;
      rounding = 10;
      blur = {
        size = 3;
        passes = 3;
        new_optimizations = true;
        xray = true;
        ignore_opacity = false;
      };

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 2;
      shadow_ignore_window = true;
      dim_inactive = true;
      dim_strength = 0.2;
      "col.shadow" = "rgba(1a1a1aee)";
      "col.shadow_inactive" = "rgba(1a1a1a88)";
    };

    animations = {
      enabled = true;
      bezier = "overshot, 0.13, 0.99, 0.29, 1.1";
      animation = [
        "windows, 1, 4, overshot, slide"
        "windowsOut, 1, 5, default, popin 80%"
        "border, 1, 5, default"
        "fade, 1, 8, default"
        "workspaces, 1, 6, overshot, slidevert"
      ];
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_fingers = 4;
      workspace_swipe_distance = 250;
      workspace_swipe_invert = true;
      workspace_swipe_min_speed_to_force = 15;
      workspace_swipe_cancel_ratio = 0.5;
      workspace_swipe_create_new = false;
    };

    xwayland.force_zero_scaling = true;
    misc = {
      # disable auto polling for config file changes
      disable_autoreload = true;

      force_default_wallpaper = 0;

      # disable dragging animation
      animate_mouse_windowdragging = false;

      # enable variable refresh rate (effective depending on hardware)
      vrr = 1;

      # we do, in fact, want direct scanout
      no_direct_scanout = false;
      animate_manual_resizes = true;
      enable_swallow = true;
      swallow_regex = "Kitty";
    };

    group = {
      groupbar = {
        "col.active" = "rgb(ffc0cb)";
        "col.inactive" = "rgba(595959aa)";
      };
    };
  };
}
