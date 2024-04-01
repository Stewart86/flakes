{
  imports = [
    (import ../../environment/hypr-variables.nix)
  ];
  # programs = {
  #   fish = {
  #     loginShellInit = ''
  #       set TTY1 (tty)
  #       [ "$TTY1" = "/dev/tty1" ] && exec Hyprland
  #     '';
  #   };
  # };
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = false;
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
