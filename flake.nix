{
  description = "First flake for testing";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  rec {

    nixosConfigurations = {

      "nixos" = nixpkgs.lib.nixosSystem {

        specialArgs = { inherit inputs outputs; };

        modules = [
          ./nixos/configuration.nix

          home-manager.nixosModules.home-manager {
            home-manager = {
              extraSpecialArgs = { inherit inputs outputs; };
              useGlobalPkgs = true;
              useUserPackages = true;
          
              users.rodrigo = import ./home-manager/home.nix;
            };
          
          }
        ];

      };

    };

  };
}
