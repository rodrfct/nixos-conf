{ config, pkgs, ... }:

{
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


  # basic configuration of git
  programs.git = {
    enable = true;
    userName = "rodrfct";
    userEmail = "rodrigoca.fct@gmail.com";
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    btop
    firefox-devedition-bin
    gdu
    neofetch
    vscodium-fhs
    yq-go
  ];

  programs.fish = {
  	enable = true;
  	interactiveShellInit = ''
  	set fish_greeting ""
  	'';
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = false;
    # custom settings
    settings = {
      format = ''
      [┌ ](bold green)$all
      [└─> ](bold green)
      '';
      
      line_break.disabled = true;
      character = {
      	success_symbol = "";
      };
    };
  };


  programs.bash = {
    enable = true;
    enableCompletion = true;

    initExtra = ''
      if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
      	shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      	exec fish $LOGIN_OPTION
      fi
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
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
