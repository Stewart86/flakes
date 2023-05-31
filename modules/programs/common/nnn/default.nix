{ pkgs, ... }:

{
  programs = {
    nnn = {
      enable = true;
      package = pkgs.nnn.override { withNerdIcons = true; };
      bookmarks = {
        "h" = "~";
        "f" = "~/Flakes";
        "g" = "~/GitHub";
        "w" = "~/Pictures/wallpapers";
        "a" = "~/ample/ample-api";
        "o" = "~/ample/frontend-pos";
      };
      extraPackages = [ ];
      plugins = {
        src = (pkgs.fetchFromGitHub {
          owner = "jarun";
          repo = "nnn";
          rev = "v4.8";
          sha256 = "sha256-QbKW2wjhUNej3zoX18LdeUHqjNLYhEKyvPH2MXzp/iQ=";
        }) + "/plugins";

        mappings = {
          f = "finder";
          o = "fzopen";
          v = "imgview";
          p = "preview-tui";
          w = "wallpaper";
        };
      };
    };
  };
  home = {
    sessionVariables = {
      NNN_FIFO = "\${HOME}/.cache/nnn/nnn.fifo";
    };
  };
}
