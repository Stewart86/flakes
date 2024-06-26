{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      lazygit
    ];
  };
  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];
  home.file.".config/lazygit/config.yml".text = ''
    customCommands:
      - key: "C"
        command: "git cz"
        description: "commit with commitizen (cz-emoji-conventional)"
        context: "files"
        loadingText: "opening commitizen commit tool"
        subprocess: true
      - key: "<c-p>"
        command: "git remote prune {{.SelectedRemote.Name}}"
        context: "remotes"
        loadingText: "Pruning..."
        description: "prune deleted remote branches"
  '';
  home.file.".czrc".text = ''
    {
      "path": "cz-emoji-conventional"
    }
  '';
}
