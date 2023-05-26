{ pkgs, ... }:

{
  programs = {
    nnn = {
      enable = true;
      package = pkgs.nnn.override { withNerdIcons = true; };
      bookmarks = { };
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
        };
      };
    };
  };
  home = {
    sessionVariables = {
      # NNN_TMPFILE = "\${HOME}/.cache/nnn/tmpfile";
      NNN_FIFO = "\${HOME}/.cache/nnn/nnn.fifo";
      # NNN_PLUG = "f:finder;o:fzopen;v:imgview;p:preview-tui";
    };
  };
}
