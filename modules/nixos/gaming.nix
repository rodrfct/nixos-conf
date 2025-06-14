{ pkgs, lib, config, ... }:

{
  options = {
    gaming = {
      emulators = lib.mkEnableOption "Add emulators";
    };
  };

  config = {

    boot.kernelPackages = lib.mkDefault pkgs.linuxKernel.packages.linux_zen;

    allowedUnfreePackages = [
      "steam"
      "steam-unwrapped"
      "steam-original"
      "discord"
    ];

    environment.systemPackages = with pkgs; [
      mangohud
      heroic
      discord
      piper
      lutris
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
        extraCompatPackages = with pkgs; [
          proton-ge-custom
          steamtinkerlaunch
        ]
        ;
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
