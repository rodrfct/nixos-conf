{ lib, ... }: 

{
  services.tlp = {
    enable = lib.mkDefault true;
  };

  hardware.bluetooth.powerOnBoot = false;
}
