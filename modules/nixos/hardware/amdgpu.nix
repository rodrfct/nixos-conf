{ pkgs, ... }:

{
  imports = [
    ./rocm.nix
  ];

  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
