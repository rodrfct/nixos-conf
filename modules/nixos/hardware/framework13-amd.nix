{ pkgs, config, lib, ... }: 

{
  imports = [
    ./laptop.nix
    ./ssd.nix
  ];

  environment.systemPackages = with pkgs; [
    framework-tool
  ];

  # Apparently AMD is more efficient with ppd
  services = {
    tlp.enable = lib.mkForce false;
    power-profiles-daemon.enable = true;
  };

  # TODO enable amd pstate
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [ framework-laptop-kmod ] ++ lib.optionals (config.boot.kernelPackages == pkgs.linuxKernel.packages.linux_zen) [ pkgs.linuxKernel.packages.linux_zen.framework-laptop-kmod ];
    kernelModules = [ "cros_ec" "cros_ec_lpcs" ];
    kernelParams = [ "nvme.noacpi=1" ];
  };

  # TODO look into zenpower
  # Needed for desktop environments to detect/manage display brightness
  hardware.sensor.iio.enable = true;
}
