# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
      ../../modules/nixos/configuration.nix
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ../../modules/nixos/gnome.nix
      ../../modules/nixos/docker.nix
    ];


  # Enable flatpak
  services.flatpak.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rodrigo = {
    isNormalUser = true;
    description = "Rodrigo";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    users.rodrigo = import ./home/default.nix;
  };

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  # boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}

