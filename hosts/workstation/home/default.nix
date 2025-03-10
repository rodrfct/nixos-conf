{ config, pkgs, ... }:

{
  imports = [
    ../../../modules/home-manager/home.nix
    ../../../modules/home-manager/hyprland.nix
    ../../../modules/home-manager/gnome-terminal.nix
    ../../../modules/home-manager/develop/develop.nix
    ../../../modules/home-manager/clase/default.nix
  ];

  home.username = "mafiasaurio";
  home.homeDirectory = "/home/mafiasaurio";
}
