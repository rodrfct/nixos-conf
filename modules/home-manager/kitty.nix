{ pkgs, config, ... }:

{
  programs = {
    kitty = {
      enable = true;

      font = {
        name = "Fira Code";
        package = pkgs.fira-code-nerdfont;
        size = 10;
      };

      settings = {
        foreground = "#${config.colorScheme.palette.base05}";
        background = "#${config.colorScheme.palette.base00}";
      };

      shellIntegration = {
        enableFishIntegration = true;
      };
    };
  };
}
