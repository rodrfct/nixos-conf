{ pkgs, lib, config, ... }:

{
  options = {
    gaming = {
      emulators = lib.mkEnableOption "Add emulators";
    };
  };

  config = {

    boot.kernelPackages = lib.mkDefault pkgs.linuxKernel.packages.linux_zen;

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg)
      ([
        "steam"
        "steam-unwrapped"
        "steam-original"
        "discord"
      ] ++ lib.optionals config.hardware.nvidia.modesetting.enable [
        "nvidia-x11"
        "nvidia-settings"
      ]);

    environment.systemPackages = with pkgs; [
      mangohud
      gpustat
      heroic
      discord
      piper
      lutris
      steamtinkerlaunch
    ] ++ lib.optionals config.gaming.emulators [
      pcsx2
      rpcs3
      retroarch-full
    ];

    services.ratbagd.enable = true;

    programs = {
      steam = {
        enable = true;
        gamescopeSession.enable = true;
      };

      gamemode.enable = true;
    };

    specialisation = {
      linux-cachy.configuration = {
        boot.kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;
      };
    };
  };

}
