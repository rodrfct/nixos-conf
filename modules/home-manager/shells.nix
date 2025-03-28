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

    initExtra = ''
      if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
      	shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      	exec fish $LOGIN_OPTION
      fi
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      
    };
  };
}
