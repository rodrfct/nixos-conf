{ pkgs, user1, ... }:

{
  imports = [
    ./shells.nix
    ./pandoc/default.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    brave
    protonvpn-gui
    iotas
    alacritty
    btop
    gdu
    lf # Yet to learn
    tldr
    nh
  ];

  programs = {
    lsd = {
      enable = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "vim";
    NIXOS_OZONE_WL = "1";
  };

  xdg.desktopEntries = {
    btop = {
  		name = "btop";
  		noDisplay = true;
  	};
  	micro = {
  		name = "micro";
  		noDisplay = true;
  	};
  	lf = {
  	  	name = "lf";
  	  	noDisplay = true;
  	};
  	fish = {
  		name = "fish";
  		noDisplay = true;
  	};
  };

  home.username = user1;
  home.homeDirectory = "/home/${user1}";

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
