{
  wayland.windowManager.hyprland.settings = {
    windowrule = [];
    windowrulev2 = [
      "float, class:^(termfloat|danmufloat|floating_btop)$"
      "size 50% 70%, class:^(termfloat|danmufloat|floating_btop)$"
      "center 1, class:^(termfloat|danmufloat|floating_btop)$"
      "animation popin, class:^(termfloat|danmufloat|floating_btop)$"

      "float, title:^(pavucontrol|imv|ncmpcpp|nemo|Bluetooth|Fcitx|Nextcloud|Bitwarden).*"
      "size 50% 70%, title:^(pavucontrol|imv|ncmpcpp|nemo|Bluetooth|Fcitx|Nextcloud|Bitwarden).*"
      "center 1, title:^(pavucontrol|imv|ncmpcpp|nemo|Bluetooth|Fcitx|Nextcloud|Bitwarden).*"
      "animation popin, title:^(pavucontrol|imv|ncmpcpp|nemo|Bluetooth|Fcitx|Nextcloud|Bitwarden).*"

      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"

      "dimaround, class:^(gcr-prompter)$"
      "dimaround, class:^(xdg-desktop-portal-gtk)$"
      "dimaround, class:^(polkit-gnome-authentication-agent-1)$"

      # fix xwayland apps
      "rounding 0, xwayland:1"
      "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
      "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"
    ];
  };
}
