# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:
let 
  user1 = "mafiasaurio";
in
{
  imports =
    [
      inputs.home-manager.nixosModules.default
      ../../modules/nixos/configuration.nix
      ./hardware-configuration.nix # Include the results of the hardware scan.

      ../../modules/nixos/kde.nix
      ../../modules/nixos/rust.nix
      ../../modules/nixos/docker.nix
    ];


  # Enable flatpak
  services.flatpak.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "nvidia-x11"
    "nvidia-settings"
    "steam"
    "steam-original"
  ];

  environment.systemPackages = with pkgs; [
    mangohud
  ];

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamemode.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user1} = {
    isNormalUser = true;
    description = "Mafiasaurio";
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

  networking.hostName = "charmander"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}

