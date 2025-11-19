{ lib, pkgs, osConfig, ... }:

{
  programs.fish = {
  	enable = true;
  	interactiveShellInit = ''
  	set fish_greeting ""
    fish_vi_key_bindings
    fastfetch
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

  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source ="${lib.getExe pkgs.pokeget-rs} ${osConfig.networking.hostName}";
        type = "command-raw";
        padding = {left = 5; right = 5;};
      };
      modules = [
        "title"
        "os"
        "kernel"
        "cpu"
        "gpu"
        "memory"
        "gamepad"
        "uptime"
        "packages"
        "shell"
        {
          type = "terminal";
          key = "Terminal";
          format = "{pretty-name}";
        }
        {
          type = "font";
          key = "Font";
          format = "{font1}";
        }
        {
          type = "terminalfont";
          key = "Terminal Font";
          format = "{name}";
        }
      ];
    };
  };
}
