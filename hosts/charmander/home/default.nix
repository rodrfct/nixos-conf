{ pkgs, ... }:

{
  imports = [
    ../../../modules/home-manager/home.nix
    ../../../modules/home-manager/develop/develop.nix
    ../../../modules/home-manager/clase/default.nix
  ];
}
