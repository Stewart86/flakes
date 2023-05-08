{ pkgs, inputs, ... }:

{
  nixpkgs.system = "x86_64-linux";

  networking = {
    hostName = "surface-nix"; # Define your hostname.
    networkmanager.enable = true;
    hosts = {
      "185.199.109.133" = [ "raw.githubusercontent.com" ];
      "185.199.111.133" = [ "raw.githubusercontent.com" ];
      "185.199.110.133" = [ "raw.githubusercontent.com" ];
      "185.199.108.133" = [ "raw.githubusercontent.com" ];
    };
  };
  time.timeZone = "Asia/Singapore";

  i18n.defaultLocale = "en_GB.UTF-8";

  security.rtkit.enable = true;
  services = {
    openssh = {
      enable = true;
    };
  };
  environment = {
    binsh = "${pkgs.dash}/bin/dash";
    shells = with pkgs; [ fish ];
    systemPackages = with pkgs; [
      exa
      git
      killall
      lsd
      neofetch
      neovim
      ranger
      socat
      wget
      bottom
      gdu
      zig
      gcc
      clang
      nodejs_20
      python311
      cargo
      rustc
      direnv
    ];
  };
  services.dbus.enable = true;

  nix = {
    settings = {
      # substituters = [
      #   "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      #   "https://cache.nixos.org/"
      # ];
      auto-optimise-store = true; # Optimise syslinks
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };
  nixpkgs.config.allowUnfree = true;

  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.11";
  };
}
