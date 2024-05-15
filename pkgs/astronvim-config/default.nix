{
  pkgs,
  stdenv,
  lib,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "astronvim-config";
  version = "20240223";

  src = fetchFromGitHub {
    owner = "astronvim";
    repo = "astronvim";
    rev = "v4.7.0";
    hash = "sha256-f9gWfw4RSa9lSIpevGGnXbUbPctC7C1bpgyXD1OzeHY=";
  };

  parser = "${pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths =
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins:
        with plugins; [
          c
          lua
          query
        ]))
      .dependencies;
  }}/parser";

  user_config = ./config;

  buildPhase = ''
    ls
    mkdir parser
    cp -r $parser/* parser
    mkdir lua/user
    cp -r $user_config/* lua/user
    ls lua/user
  '';

  installPhase = ''
    cp -r . $out
  '';

  meta = {
    description = "Personal Astronvim configuration";
    homepage = "https://github.com/stewart86/astronvim_config";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
    maintainers = [lib.maintainers.stewart86];
  };
}
