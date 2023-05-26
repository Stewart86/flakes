{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      ls = "lsd -A";
      ll = "lsd -l -A";
      tree = "lsd --tree";
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
  home.file.".config/fish/functions/fish_prompt.fish".source = ./functions/fish_prompt.fish;
  home.file.".config/fish/functions/fishsauce.fish".text = import ./functions/fishsauce.nix;
  home.file.".config/fish/functions/n.fish".text = import ./functions/n.nix;
  home.file.".config/fish/functions/r.fish".text = import ./functions/r.nix;
  home.file.".config/fish/functions/sd.fish".text = import ./functions/sd.nix;
  home.file.".config/fish/functions/top.fish".text = import ./functions/top.nix;
  home.file.".config/fish/functions/vsd.fish".text = import ./functions/vsd.nix;

  home.file.".config/fish/fish_variables".text = import ./fish_variables.nix;
  home.file.".config/fish/omp_theme/stewart.omp.json".source = ./omp_theme/stewart.omp.json;
}
