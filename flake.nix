{
  description = "First flake for testing";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    rust-overlay.url = "github:oxalica/rust-overlay";
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

  outputs = { self, nixpkgs, home-manager, rust-overlay, chaotic, ... }@inputs:
  let
    inherit (self) outputs;
  in
  {
    nixosConfigurations = {

      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

          specialArgs = {
            inherit inputs outputs;
            user1 = "mafiasaurio";
          };

        modules = [
          ./hosts/workstation/configuration.nix

          home-manager.nixosModules.home-manager {
            home-manager = {
                extraSpecialArgs = {
                  inherit inputs outputs;
                  user1 = "mafiasaurio";
                };
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }

          inputs.stylix.nixosModules.stylix
        ];
      };

      "charmander" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

          specialArgs = {
            inherit inputs outputs;
            user1 = "mafiasaurio";
          };

        modules = [
          ./hosts/charmander/configuration.nix
          chaotic.nixosModules.default

          home-manager.nixosModules.home-manager {
            home-manager = {
                extraSpecialArgs = {
                  inherit inputs outputs;
                  user1 = "mafiasaurio";
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
