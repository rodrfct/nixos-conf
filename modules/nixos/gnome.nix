{ config, lib, pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.

  services.xserver = {
		enable = true;
  	displayManager.gdm.enable = true;
  	desktopManager.gnome.enable = true;
  	excludePackages = [
  		pkgs.xterm
  	];
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  # Excluded packages
  environment.gnome.excludePackages = with pkgs; [
  	gnome-tour
  	gnome-console
  	gnome.cheese
  	gnome.simple-scan
  	gnome.geary
  	gnome.gnome-contacts
  	gnome.gnome-music
  	gnome.gnome-maps
  	epiphany
  ];

  # Wanted packages not installed by default
  environment.systemPackages = with pkgs.gnome; [
    (lib.mkIf (config.services.flatpak.enable == true) gnome-software)
    gnome-terminal
    gnome-tweaks
  ];
  
}
