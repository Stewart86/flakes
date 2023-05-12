{ pkgs, user, ... }:

{
  imports =
    (import ../../../modules/hardware) ++
    [
      ../hardware-configuration.nix
      ../../../modules/fonts
    ] ++ [
      ../../../modules/desktop/hyprland
    ];


  microsoft-surface.kernelVersion = "6.1.18";
  hardware.opengl = {
    driSupport = true;
    enable = true;
  };

  users.users.root.initialHashedPassword = "$6$88FQ7FvPTjgmlVtw$xqY5.Ux1WPJniFpukO6RAtbLVf6XXTU2ulU6zvmiuU/lhtKIIFZux2IrQ2al/nd3zPWvJ1OEk0c8m5ACoVAtM.";
  users.users.${user} = {
    initialHashedPassword = "$6$88FQ7FvPTjgmlVtw$xqY5.Ux1WPJniFpukO6RAtbLVf6XXTU2ulU6zvmiuU/lhtKIIFZux2IrQ2al/nd3zPWvJ1OEk0c8m5ACoVAtM.";
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "docker" ];
    packages = (with pkgs; [
      whatsapp-for-linux
      slack
      microsoft-edge
      nextcloud-client
    ]);
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
      "splash"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-chinese-addons
      fcitx5-table-extra
      fcitx5-pinyin-moegirl
      fcitx5-pinyin-zhwiki
    ];
  };

  programs.hyprland.enable = true;
  programs.fish.enable = true;
  programs.ssh.startAgent = true;
  programs.evolution = {
    enable = true;
    plugins = [ pkgs.evolution-ews ];
  };

  environment = {
    systemPackages = with pkgs; [
      libnotify
      wl-clipboard
      wlr-randr
      cinnamon.nemo
      networkmanagerapplet
      wev
      wf-recorder
      alsa-lib
      alsa-utils
      flac
      pulsemixer
      pavucontrol
      imagemagick
      flameshot
      grim
      gimp
      cliphist
      polkit_gnome
    ];
  };
  services = {
    gnome = {
      gnome-keyring = {
        enable = true;
      };
      evolution-data-server = {
        enable = true;
      };
    };
    passSecretService.enable = true;
    dbus.packages = [ pkgs.gcr ];
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

  virtualisation.docker.enable = true;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  security.polkit.enable = true;
  security.sudo = {
    enable = true;
    extraConfig = ''
      ${user} ALL=(ALL) NOPASSWD:ALL
    '';
  };
  security.doas = {
    enable = false;
    extraConfig = ''
      permit nopass :wheel
    '';
  };
}
