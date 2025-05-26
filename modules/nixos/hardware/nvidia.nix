{ pkgs, ... }:

{
  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia.modesetting.enable = true;
    nvidia.open = false;
  };

  environment.systemPackages = with pkgs; [
    gpustat
  ];
}
