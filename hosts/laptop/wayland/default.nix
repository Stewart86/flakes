{ pkgs
, user
, ...
}: {
  imports =
    (import ../../../modules/hardware)
    ++ [
      ../hardware-configuration.nix
      ../../../modules/fonts
    ]
    ++ [
      ../../../modules/desktop/hyprland
    ]
    ++ [ (import ../../../modules/greetd) ];

  microsoft-surface = {
    kernelVersion = "6.6.13";
  };

  hardware.graphics = {
    enable = true;
  };

  users.users.root.initialHashedPassword = "$6$88FQ7FvPTjgmlVtw$xqY5.Ux1WPJniFpukO6RAtbLVf6XXTU2ulU6zvmiuU/lhtKIIFZux2IrQ2al/nd3zPWvJ1OEk0c8m5ACoVAtM.";
  users.users.${user} = {
    initialHashedPassword = "$6$88FQ7FvPTjgmlVtw$xqY5.Ux1WPJniFpukO6RAtbLVf6XXTU2ulU6zvmiuU/lhtKIIFZux2IrQ2al/nd3zPWvJ1OEk0c8m5ACoVAtM.";
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "docker" ];
    packages = with pkgs; [
      nextcloud-client
    ];
  };

  programs = {
    hyprland.enable = true;
    fish.enable = true;
    seahorse.enable = true;

    ssh.startAgent = true;

    # evolution = {
    #   enable = true;
    #   plugins = [pkgs.evolution-ews];
    # };
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
}
