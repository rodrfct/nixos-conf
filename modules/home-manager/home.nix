{ pkgs, ... }:

{
  imports = [
    ./shells.nix
    ./pandoc/default.nix
    # ./kitty.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    alacritty
    btop
    gdu
    gnome-calendar
    lf # Yet to learn
    tldr
    nh
  ];

  programs = {
    lsd = {
      enable = true;
      enableAliases = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  xdg.desktopEntries = {
  	# firefox-developer-edition = lib.mkOverride {
    #   name = "Firefox Developer Edition";
    # };

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
