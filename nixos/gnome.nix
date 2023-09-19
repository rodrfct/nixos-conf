{ config, pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.

  services.xserver = {
  	displayManager.gdm.enable = true;
  	desktopManager.gnome.enable = true;
  	excludePackages = [
  		pkgs.xterm
  	];
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
    gnome-software
    gnome-terminal
    gnome-tweaks
  ];
  
}
