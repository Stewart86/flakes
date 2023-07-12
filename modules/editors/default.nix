{ pkgs, ... }:

{
  programs = {
    neovim = {
      defaultEditor = true;
      enable = true;
      viAlias = true;
      vimAlias = true;

      withPython3 = true;
      withNodeJs = true;
      withRuby = false;

      # extraPackages = with pkgs; [ ];
      # plugins = with pkgs.vimPlugins; [];
    };
  };
  home = {
    packages = with pkgs; [
      #-- LSP --#
      nodePackages_latest.typescript
      nodePackages_latest.eslint_d
      nodePackages_latest.prettier_d_slim
      nodePackages_latest.typescript-language-server
      nodePackages_latest.vscode-langservers-extracted
      nodePackages_latest.bash-language-server
      nodePackages_latest."@tailwindcss/language-server"
      nodePackages.jsonlint
      nil
      rnix-lsp
      lua-language-server
      pyright
      rust-analyzer
      taplo
      #-- tree-sitter --#
      tree-sitter
      #-- format --#
      stylua
      black
      nixpkgs-fmt
      rustfmt
      beautysh
      nodePackages.prettier
      ruff
      yamlfmt
      #-- Debug --#
      lldb
      mypy
      cargo
      rustc
      luarocks
      zig
    ];
  };

  home.file.".config/nvim".source = pkgs.astronvim-config;
}
