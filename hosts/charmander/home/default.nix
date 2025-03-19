{ user1, pkgs, ... }:

{
  imports = [
    ../../../modules/home-manager/home.nix
    ../../../modules/home-manager/develop/develop.nix
    ../../../modules/home-manager/clase/default.nix
  ];

  home.username = user1;
  home.homeDirectory = "/home/${user1}";

  home.packages = with pkgs; [
    heroic
    discord
    piper
    lutris
    steamtinkerlaunch
  ];
}
