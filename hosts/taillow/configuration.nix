# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, user1, pkgs, lib, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
      ../../modules/nixos/configuration.nix
      ./hardware-configuration.nix # Include the results of the hardware scan.

      ../../modules/nixos/stylix.nix

      ../../modules/nixos/de/kde.nix
      # ../../modules/nixos/de/hyprland.nix
      ../../modules/nixos/gaming.nix
      ../../modules/nixos/distrobox.nix
      ../../modules/nixos/ml/ollama.nix
    ];

  stylix.base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";


  services.fwupd.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user1} = {
    isNormalUser = true;
    description = "Mafiasaurio";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    users.${user1} = import ./home/default.nix;
  };

  networking.hostName = "taillow";
}

