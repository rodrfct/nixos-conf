{ pkgs, ...}: 

{
  services = {
    desktopManager.plasma6.enable = true;
    xserver.enable = true;
    displayManager = {

      # sddm = {
      #   enable = true;
      #   wayland.enable = true;
      # };

      plasma-login-manager.enable = true;
    };
  };

  programs.xwayland.enable = true;
  
  environment.systemPackages = with pkgs; [
    utterly-nord-plasma
    kdePackages.kdeconnect-kde
    kdePackages.qtwebengine
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    pkgs.xterm
    elisa
    krdp
  ];
}
