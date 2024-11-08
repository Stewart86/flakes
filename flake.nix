{
  description = "The most basic configuration";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      hyprpicker.url = "github:hyprwm/hyprpicker";
      hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      hypr-contrib.url = "github:hyprwm/contrib";
      flake-utils.url = "github:numtide/flake-utils";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    };

  outputs = inputs @ { self, nixpkgs, flake-utils, ... }:
    let
      user = "stewart";
      selfPkgs = import ./pkgs;
    in
    flake-utils.lib.eachSystem [ "x86_64-linux" ]
      (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              self.overlays.default
            ];
          };
        in
        {
          devShells = {
            #run by `nix devlop`
            default = import ./shell.nix { inherit pkgs; };
          };
        }
      )
    // {
      overlays.default = selfPkgs.overlay;
      nixosConfigurations = (
        # NixOS configurations
        import ./hosts {
          system = "x86_64-linux";
          inherit nixpkgs self inputs user;
        }
      );
    };
}
