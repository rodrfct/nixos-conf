{ config, pkgs, ... }:

{
  imports = [
    ../../../modules/home-manager/home.nix
    ../../../modules/home-manager/kitty.nix
    ../../../modules/home-manager/develop/develop.nix
    ../../../modules/home-manager/clase/default.nix
  ];

  home.username = "mafiasaurio";
  home.homeDirectory = "/home/mafiasaurio";
}
