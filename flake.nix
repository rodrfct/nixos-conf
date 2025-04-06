{
  description = "First flake for testing";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-alien.url = "github:thiagokokada/nix-alien";

    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    pandoc-setup = {
      url = "github:rodrfct/pandoc-setup";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, chaotic, ... }@inputs:
  let
    inherit (self) outputs;
  in
  {
    nixosConfigurations = {

      "nixos" =
        let
          user1 = "mafiasaurio";
        in
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

          specialArgs = {
            inherit inputs outputs user1;
          };

        modules = [
          ./hosts/workstation/configuration.nix

          home-manager.nixosModules.home-manager {
            home-manager = {
                extraSpecialArgs = {
                  inherit inputs outputs user1;
                };
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }

          inputs.stylix.nixosModules.stylix
        ];
      };

      "charmander" = 
        let
          user1 = "mafiasaurio";
        in
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

          specialArgs = {
            inherit inputs outputs user1;
          };

        modules = [
          ./hosts/charmander/configuration.nix
          chaotic.nixosModules.default

          home-manager.nixosModules.home-manager {
            home-manager = {
                extraSpecialArgs = {
                  inherit inputs outputs user1;
                };
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }

          inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };
}
