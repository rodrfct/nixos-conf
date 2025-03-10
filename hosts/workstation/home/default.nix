{ user1, ... }:

{
  imports = [
    ../../../modules/home-manager/home.nix
    ../../../modules/home-manager/hyprland.nix
    ../../../modules/home-manager/gnome-terminal.nix
    ../../../modules/home-manager/develop/develop.nix
    ../../../modules/home-manager/clase/default.nix
  ];

  home.username = user1;
  home.homeDirectory = "/home/${user1}";
}
