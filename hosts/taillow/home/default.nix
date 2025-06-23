{ pkgs, ... }:

{
  imports = [
    ../../../modules/home-manager/home.nix
    # ../../../modules/home-manager/wm/hyprland/hyprland.nix
    ../../../modules/home-manager/wm/waybar/layouts/default.nix
    ../../../modules/home-manager/develop/develop.nix
  ];

  home.packages = with pkgs; [
    firefox-devedition
  ];
}
