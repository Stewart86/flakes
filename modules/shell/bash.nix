{
  programs = {
    bash = {
      enable = true;
      initExtra = ''
        eval "$(oh-my-posh init bash --config ~/.config/fish/omp_theme/stewart.omp.json)"
      '';
    };
  };
}
