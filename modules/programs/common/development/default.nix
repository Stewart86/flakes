{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs
    mongodb-compass
    gh
  ];
}
