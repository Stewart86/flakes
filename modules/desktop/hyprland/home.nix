{
  imports = [
    (import ../../environment/hypr-variables.nix)
  ];
  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec ~/github/Hyprland/build/src/Hyprland
        fi
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
