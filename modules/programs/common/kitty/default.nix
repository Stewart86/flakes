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
      };
    };
  };
}
