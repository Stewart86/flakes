{
  imports = [
    ./variables.nix
    ./settings.nix
    ./binds.nix
    ./rules.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;

    systemd = {
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };
}
