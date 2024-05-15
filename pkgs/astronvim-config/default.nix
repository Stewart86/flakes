{
  pkgs,
  stdenv,
  lib,
}:
stdenv.mkDerivation {
  pname = "astronvim-config";
  version = "20240515";

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
  src = ./config;
  user_config = ./config;

  buildPhase = ''
    ls
    mkdir parser
    cp -r $parser/* parser
    cp -r $user_config/* .
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
