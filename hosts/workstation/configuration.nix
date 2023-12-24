# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
let 
  user1 = "rodrigo";
in
{
  imports =
    [
      inputs.home-manager.nixosModules.default
      ../../modules/nixos/configuration.nix
      ./hardware-configuration.nix # Include the results of the hardware scan.

      ../../modules/nixos/gnome.nix
      ../../modules/nixos/rust.nix
      ../../modules/nixos/docker.nix
    ];


  # Enable flatpak
  services.flatpak.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user1} = {
    isNormalUser = true;
    description = "Rodrigo";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    users.${user1} = import ./home/default.nix;
  };

  console.colors = with config.home-manager.users.${user1}.colorScheme.colors; [
    base00
    base01
    base02
    base03
    base04
    base05
    base06
    base07
    base08
    base09
    base0A
    base0B
    base0C
    base0D
    base0E
    base0F
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  # boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}

