{
  programs = {
    kitty = {
      enable = true;
      environment = {};
      keybindings = {};
      settings = {
        allow_remote_control = true;
        listen_on = "unix:/tmp/kitty";
        enabled_layouts = "splits";

        scrollback_lines = 10000;
        placement_strategy = "center";

        enable_audio_bell = "no";
        visual_bell_duration = "0.1";

        copy_on_select = "clipboard";

        selection_foreground = "none";
        selection_background = "none";

        # colors
        background_opacity = "0.7";
      };

      theme = "Catppuccin-Mocha";
    };
  };
}
