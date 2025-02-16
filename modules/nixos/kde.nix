{ pkgs, ...}: 

{
  services.desktopManager.plasma6.enable = true;
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    theme = "Dr460nized";
  };

  programs.xwayland.enable = true;
  
  environment.systemPackages = with pkgs; [
    utterly-nord-plasma
    dr460nized-kde-theme
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    pkgs.xterm
    elisa
    krdp
    kwalletmanager
  ];
}
