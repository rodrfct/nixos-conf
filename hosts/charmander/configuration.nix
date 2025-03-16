# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, user1, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
      ../../modules/nixos/configuration.nix
      ../../modules/nixos/fhsEnv.nix
      ./hardware-configuration.nix # Include the results of the hardware scan.

      ../../modules/nixos/kde.nix
    ];


  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  # Enable flatpak
  services.flatpak.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "nvidia-x11"
    "nvidia-settings"
    "steam"
    "steam-unwrapped"
    "steam-original"
    "discord"
  ];

  environment.systemPackages = with pkgs; [
    mangohud
  ];

  services.ratbagd.enable = true;

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

  networking.hostName = "charmander"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}

