{ config, pkgs, lib, inputs, user1, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
      ../../modules/nixos/configuration.nix
      ../../modules/nixos/gaming
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ../../modules/nixos/hardware/lact.nix
      ../../modules/nixos/ml/llama-cpp.nix

      ../../modules/nixos/de/kde.nix
      ../../modules/nixos/stylix.nix
    ];

  rocm.enable = true;

  services.llama-cpp.model = lib.mkForce "/llms/Qwen3-32B-Q3_K_S.gguf";

  services.hardware.openrgb.enable = true;

  gaming.useCachyKernel = true;

  boot.loader.timeout = 10;

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

