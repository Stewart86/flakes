{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "astronvim-config";
  version = "20230509";

  src = fetchFromGitHub {
    owner = "astronvim";
    repo = "astronvim";
    rev = "v3.29.5";
    hash = "sha256-EaQVUhqfnCDJnB9c5JL1w8zQghvzx02wcMJqhqbVNHY=";
  };
  user_config = ./config;

  buildPhase = ''
    ls
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
    maintainers = [ lib.maintainers.stewart86 ];
  };
}
