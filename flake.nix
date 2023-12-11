{
  description = "First flake for testing";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    pandoc-setup = {
      url = "github:rodrfct/pandoc-setup";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {

      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs outputs; };

        modules = [
          ./hosts/workstation/configuration.nix

          home-manager.nixosModules.home-manager {
            home-manager = {
              extraSpecialArgs = { inherit inputs outputs; };
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }
        ];

      };

    };

  };
}
