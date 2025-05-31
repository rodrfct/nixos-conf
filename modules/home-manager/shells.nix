{ config, pkgs, ... }:

{
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
      
      command_timeout = 1000;
      line_break.disabled = true;
      character = {
      	success_symbol = "";
      };
    };
  };


  programs.bash = {
    enable = true;
    enableCompletion = true;

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      
    };
  };
}
