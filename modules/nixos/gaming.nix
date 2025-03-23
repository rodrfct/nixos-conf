{ pkgs, lib, config, ... }:

{
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) ([
    "steam"
    "steam-unwrapped"
    "steam-original"
    "discord"
  ] ++ (if config.hardware.nvidia.modesetting.enable then [
      "nvidia-x11"
      "nvidia-settings"
    ] else []));

  environment.systemPackages = with pkgs; [
    mangohud
    gpustat
    heroic
    discord
    piper
    lutris
    steamtinkerlaunch
  ];

  services.ratbagd.enable = true;

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamemode.enable = true;
  };

}
