{user, ...}: {
  imports =
    [(import ../../../modules/desktop/hyprland/home.nix)]
    ++ [(import ../../../modules/scripts)]
    ++ [(import ../../../modules/editors)]
    ++ [(import ../../../modules/xdg)]
    ++ (import ../../../modules/shell)
    ++ (import ../../../modules/programs/wayland)
    ++ (import ../../../modules/theme/catppuccin-dark/wayland);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "22.11";
}
