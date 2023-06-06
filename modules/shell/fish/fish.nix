{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = { };
    shellAbbrs = {
      ls = "lsd -A";
      ll = "lsd -l -A";
      tree = "lsd --tree";

      # Git
      gc = "git add . && git commit -m ";
      gca = "git add . && git commit -m 'auto commit' && git push";
      gp = "git push";
      gpl = "git pull";
      lg = "lazygit";
    };
    interactiveShellInit = ''
      oh-my-posh init fish --config ~/.config/fish/omp_theme/stewart.omp.json | source
    '';
  };
  home = {
    packages = with pkgs; [
      oh-my-posh
    ];
  };
  home.file.".config/fish/functions/n.fish".text = import ./functions/n.nix;
  home.file.".config/fish/functions/sd.fish".text = import ./functions/sd.nix;
  home.file.".config/fish/functions/vsd.fish".text = import ./functions/vsd.nix;

  home.file.".config/fish/fish_variables".text = import ./fish_variables.nix;
  home.file.".config/fish/omp_theme/stewart.omp.json".source = ./omp_theme/stewart.omp.json;
}
