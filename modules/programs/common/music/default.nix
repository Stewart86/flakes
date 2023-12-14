{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cava
      mpc-cli
      go-musicfox
      youtube-tui
      # disabling youtube-music because it's electron is outdated
      # youtube-music
    ];
  };
  programs = {
    ncmpcpp = {
      enable = true;
      mpdMusicDir = null;
    };
  };
  home.file = {
    ".config/ncmpcpp/config".text = ''
      mpd_music_dir = ~/Music
    '';
  };

  services = {
    mpd = {
      enable = true;
      musicDirectory = "~/Music";
      extraConfig = ''
        audio_output {
                type            "pipewire"
                name            "PipeWire Sound Server"
        }
      '';
    };
  };
}
