{ config, pkgs, user, ... }:

{
  imports =
    (import ../../../modules/hardware) ++
    [
      ../hardware-configuration.nix
      ../../../modules/fonts
    ] ++ [
      ../../../modules/desktop/hyprland
    ];

  programs.fish.enable = true;
  programs.ssh.startAgent = true;
  programs.evolution = {
    enable = true;
    plugins = [ pkgs.evolution-ews ];
  };

  microsoft-surface.kernelVersion = "6.1.18";
  hardware.opengl = {
    driSupport = true;
    enable = true;
  };

  users.users.root.initialHashedPassword = "$6$88FQ7FvPTjgmlVtw$xqY5.Ux1WPJniFpukO6RAtbLVf6XXTU2ulU6zvmiuU/lhtKIIFZux2IrQ2al/nd3zPWvJ1OEk0c8m5ACoVAtM.";
  users.users.${user} = {
    initialHashedPassword = "$6$88FQ7FvPTjgmlVtw$xqY5.Ux1WPJniFpukO6RAtbLVf6XXTU2ulU6zvmiuU/lhtKIIFZux2IrQ2al/nd3zPWvJ1OEk0c8m5ACoVAtM.";
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ];
    packages = (with pkgs; [
      whatsapp-for-linux
      slack
      microsoft-edge
      nextcloud-client
    ]) ++ (with config.nur.repos;[
      # linyinfeng.icalingua-plus-plus
    ]);
  };
  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = {
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
      "i915.force_probe=9a49"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-rime fcitx5-chinese-addons fcitx5-table-extra fcitx5-pinyin-moegirl fcitx5-pinyin-zhwiki ];
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
      logiops
      cliphist
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
