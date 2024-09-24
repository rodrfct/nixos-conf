{ pkgs, ...}: 

{
  services.desktopManager.plasma6.enable = true;
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  programs.xwayland.enable = true;
  
  environment.systemPackages = [
    pkgs.utterly-nord-plasma
  ];
}
