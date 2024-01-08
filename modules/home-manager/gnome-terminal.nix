{ config, ... }:

{
  programs.gnome-terminal = {
    enable = true;

    profile."b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      default = true;
      visibleName = "default";
      audibleBell = false;
      cursorBlinkMode = "on";
      colors = with config.colorScheme.colors; {
        foregroundColor = base05;
        backgroundColor = base00;
        palette = [
          base00
          base01
          base02
          base03
          base04
          base05
          base06
          base07
          base08
          base09
          base0A
          base0B
          base0C
          base0D
          base0E
          base0F
        ];
      };
    };
  };
}
