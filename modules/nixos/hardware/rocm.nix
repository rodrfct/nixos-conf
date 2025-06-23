{ pkgs, config, lib, ... }:

{
  options = {
    rocm.enable = lib.mkEnableOption "Enable ROCm";
  };

  config = {
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [] ++ lib.optionals config.rocm.enable [
        rocmPackages.clr.icd
      ];
    };

    environment.systemPackages = with pkgs; [] ++ lib.optionals config.rocm.enable [
      rocmPackages.rocminfo
    ];

  };
}
