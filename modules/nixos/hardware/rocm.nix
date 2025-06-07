{ pkgs, config, lib, ... }:

{
  options = {
    rocm.enable = lib.mkEnableOption "Enable ROCm";
  };

  config = {
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    };

    environment.systemPackages = with pkgs; [
      rocmPackages.rocminfo
    ];

  };
}
