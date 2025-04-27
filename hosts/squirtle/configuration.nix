
{ config, pkgs, inputs, user1, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
      ../../modules/nixos/configuration.nix
      ./hardware-configuration.nix # Include the results of the hardware scan.

      ../../modules/nixos/stylix.nix

      ../../modules/nixos/hyprland.nix
    ];

  environment.systemPackages = with pkgs; [
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user1} = {
    isNormalUser = true;
    description = "Mafiasaurio";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    users.${user1} = import ./home/default.nix;
  };

  networking.hostName = "squirtle"; # Define your hostname.
  networking.firewall.allowedTCPPorts = [ 5173 ];
}

