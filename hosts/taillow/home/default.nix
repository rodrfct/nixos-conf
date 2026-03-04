{ pkgs, ... }:

{
  imports = [
    ../../../modules/home-manager/home.nix
    # ../../../modules/home-manager/wm/hyprland/hyprland.nix
    ../../../modules/home-manager/wm/waybar/layouts/default.nix
    ../../../modules/home-manager/develop/develop.nix
    ../../../modules/home-manager/distrobox.nix
    ../../../modules/home-manager/develop/vscode.nix
  ];

  home.packages = with pkgs; [
    firefox-devedition
  ];

  programs.distrobox.containers = {
    debian = {
      additional_packages = "git fish";
      image = "debian:latest";
      init_hooks = [];
    };
    plat-v3 = {
      additional_packages = "nodejs npm neovim";
      clone = "common-debian";
    };
  };
}
