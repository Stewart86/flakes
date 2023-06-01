{
  imports = [
    (import ../../environment/hypr-variables.nix)
  ];
  programs = {
    fish = {
      loginShellInit = ''
        set TTY (tty)
        [ "$TTY1" = "/dev/tty1" ] && exec Hyprland
      '';
    };
  };
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    nvidiaPatches = false;
    extraConfig = builtins.readFile ./hyprland.conf;
  };
}
