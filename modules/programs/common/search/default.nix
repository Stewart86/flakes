{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      bat
      fd
      ripgrep
    ];
  };
  programs = {
    fzf.enable = true;
  };
}
