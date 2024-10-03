{
  programs = {
    kitty = {
      enable = true;
      environment = { };
      keybindings = { };
      settings = {
        allow_remote_control = true;
        listen_on = "unix:/tmp/kitty";
        enabled_layouts = "splits";

        scrollback_lines = 10000;
        placement_strategy = "center";

        enable_audio_bell = "no";
        visual_bell_duration = "0.1";

        copy_on_select = "clipboard";

        # colors
        italic_font = "auto";
        bold_italic_font = "auto";
        mouse_hide_wait = 2;
        cursor_shape = "block";
        url_color = "#0087bd";
        url_style = "dotted";
        confirm_os_window_close = 0;
        background_opacity = "0.8";
        dynamic_background_opacity = true;

        selection_foreground = "none";
        selection_background = "none";
      };

      font.name = "jetbrains mono nerd font";
      font.size = 10;

      themeFile = "Catppuccin-Mocha";
    };
  };
}
