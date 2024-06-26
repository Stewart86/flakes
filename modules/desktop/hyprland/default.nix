{
  pkgs,
  inputs,
  ...
}: {
  imports = [../../programs/wayland/waybar/hyprland_waybar.nix];
  programs = {
    dconf.enable = true;
    light.enable = true;
  };

  environment.systemPackages = with pkgs; [
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    swaylock-effects
    pamixer
  ];

  environment.variables.NIXOS_OZONE_WL = "1";

  security.pam.services.swaylock.text = "auth include login";
  xdg.portal = {
    enable = true;
    wlr.enable = false;
  };
}
