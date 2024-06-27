{ system, self, nixpkgs, inputs, user, ... }:

let
  lib = nixpkgs.lib;
in
{
  laptop = lib.nixosSystem {
    # Laptop profile
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = [
      ./laptop/wayland
    ] ++ [
      ./system.nix
    ] ++ [
      inputs.home-manager.nixosModules.home-manager
      inputs.nixos-hardware.nixosModules.microsoft-surface-surface-pro-intel
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          users.${user} = {
            imports = [
              (import ./laptop/wayland/home.nix)
            ];
          };
        };
        nixpkgs = {
          overlays =
            (import ../overlays)
              ++ [
              self.overlays.default
            ];
        };
      }
    ];
  };
}
