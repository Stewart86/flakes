{ config, lib, ... }:
{
  imports = [ ./swww.nix ];
  config = lib.mkIf (config.wayland.windowManager.hyprland.enable) {
    programs.swww.enable = true;
  };
}
