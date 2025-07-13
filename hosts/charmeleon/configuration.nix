{ config, pkgs, lib, inputs, user1, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
      ../../modules/nixos/configuration.nix
      ../../modules/nixos/gaming.nix
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ../../modules/nixos/hardware/lact.nix

      ../../modules/nixos/de/kde.nix
      ../../modules/nixos/stylix.nix
    ];

  services.hardware.openrgb.enable = true;

  gaming.useCachyKernel = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user1} = {
    isNormalUser = true;
    description = "Mafiasaurio";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    users.${user1} = import ./home/default.nix;
  };

  networking.hostName = "charmeleon"; # Define your hostname.
}

