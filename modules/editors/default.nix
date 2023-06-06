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
      plugins = with pkgs.vimPlugins; [
        nvim-treesitter.withPlugins
        (p: [
          p.tree-sitter-nix
          p.tree-sitter-python
          p.tree-sitter-lua
          p.tree-sitter-javascript
          p.tree-sitter-css
          p.tree-sitter-html
          p.tree-sitter-toml
          p.tree-sitter-yaml
          p.tree-sitter-json
          p.tree-sitter-rust
          p.tree-sitter-bash
          p.tree-sitter-fish
          p.tree-sitter-go
          p.tree-sitter-markdown
        ])
      ];

    };
  };
  home = {
    packages = with pkgs; [
      #-- LSP --#
      nodePackages_latest.typescript
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
    ];
  };

  home.file.".config/nvim".source = pkgs.astronvim-config;
}
