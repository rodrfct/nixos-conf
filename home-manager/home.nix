{ config, pkgs, inputs, ... }:

{
  imports = [
    ./shells.nix
    ./develop.nix
  ];

  home.username = "rodrigo";
  home.homeDirectory = "/home/rodrigo";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    btop
    fira-code
    firefox-devedition-bin
    gdu
    gnome.gnome-calendar
    neofetch
    ranger
    yq-go
  ];

  xdg.desktopEntries = {
  	#firefox-devedition.name = "Firefox Developer Edition";

  	btop = {
  		name = "btop";
  		noDisplay = true;
  	};
  	micro = {
  		name = "micro";
  		noDisplay = true;
  	};
  	fish = {
  		name = "fish";
  		noDisplay = true;
  	};
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
