# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, user1, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
      ../../modules/nixos/configuration.nix
      ./hardware-configuration.nix # Include the results of the hardware scan.

      ../../modules/nixos/stylix.nix

      ../../modules/nixos/de/gnome.nix
      ../../modules/nixos/de/hyprland.nix
      ../../modules/nixos/gaming.nix
    ];

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

