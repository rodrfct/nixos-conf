{ config, ... }:

{
  programs.gnome-terminal = {
    enable = true;

    profile."b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      default = true;
      visibleName = "default";
      audibleBell = false;
      cursorBlinkMode = "on";
    };
  };
}
