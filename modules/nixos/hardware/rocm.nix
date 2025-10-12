{ pkgs, config, lib, ... }:

{
  options = {
    rocm.enable = lib.mkEnableOption "Enable ROCm";
  };

  config = {
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [] ++ lib.optionals config.rocm.enable [
        rocmPackages.clr
        rocmPackages.clr.icd
        rocmPackages.rocm-runtime
        rocmPackages.rocm-core
        rocmPackages.rocm-cmake
      ];
    };

    environment.systemPackages = with pkgs; [] ++ lib.optionals config.rocm.enable [
      rocmPackages.rocminfo
      rocmPackages.rocm-tests
    ];

  };
}
