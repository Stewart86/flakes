{ pkgs
, inputs
, user
, ...
}: {
  nixpkgs.system = "x86_64-linux";

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 442 ];
      # allowedUDPPortRanges = [
      #   { from = 4000; to = 4007; }
      #   { from = 8000; to = 8010; }
      # ];
    };
    hostName = "surface-nix";
    networkmanager.enable = true;
    hosts = {
      "185.199.109.133" = [ "raw.githubusercontent.com" ];
      "185.199.111.133" = [ "raw.githubusercontent.com" ];
      "185.199.110.133" = [ "raw.githubusercontent.com" ];
      "185.199.108.133" = [ "raw.githubusercontent.com" ];
    };
  };

  time.timeZone = "Asia/Singapore";

  i18n = {
    defaultLocale = "en_GB.UTF-8";

    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-rime
          fcitx5-chinese-addons
          fcitx5-table-extra
          fcitx5-pinyin-moegirl
          fcitx5-pinyin-zhwiki
        ];
        waylandFrontend = true;
      };
    };
  };

  security = {
    rtkit.enable = true;

    # unlock GPG keyring on login
    pam.services.greetd.enableGnomeKeyring = true;

    polkit.enable = true;

    sudo = {
      enable = true;
      extraConfig = ''
        ${user} ALL=(ALL) NOPASSWD:ALL
      '';
    };

    doas = {
      enable = false;
      extraConfig = ''
        permit nopass :wheel
      '';
    };
  };

  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = {
      grub = {
        configurationLimit = 5;
      };
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = 1;
    };
    kernelParams = [
      "quiet"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  services = {
    dbus = {
      enable = true;
      packages = with pkgs; [
        gcr
        gnome-settings-daemon
      ];
    };

    openssh = {
      enable = true;
    };

    gnome = {
      gnome-keyring = {
        enable = true;
      };
      # evolution-data-server = {
      #   enable = true;
      # };
    };

    passSecretService.enable = true;
    udev.packages = with pkgs; [ gnome-settings-daemon ];
    getty.autologinUser = "${user}";
    gvfs.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  environment = {
    binsh = "${pkgs.dash}/bin/dash";
    shells = with pkgs; [ fish ];
    systemPackages = with pkgs; [
      alsa-lib
      alsa-utils
      brave
      nemo
      cliphist
      direnv
      flac
      gdu
      gimp
      git
      grim
      imagemagick
      inkscape
      killall
      libnotify
      lsd
      neofetch
      neovim
      networkmanagerapplet
      pavucontrol
      polkit_gnome
      pulsemixer
      socat
      swappy
      swaynotificationcenter
      unzip
      waypaper
      wev
      wf-recorder
      wget
      wl-clipboard
      wlr-randr
      xdg-utils
      zoxide
    ];
  };

  nix = {
    settings = {
      substituters = [
        "https://cache.nixos.org?priority=10"
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://yazi.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.git;
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
