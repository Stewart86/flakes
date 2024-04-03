{pkgs, ...}: {
  home.packages = with pkgs; [
    webcord
    tdesktop
    whatsapp-for-linux
    slack
  ];
}
