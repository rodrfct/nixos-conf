{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi-power-menu
  ];

  programs = {
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "*" = {
          padding = mkLiteral "12px";
          border-radius = mkLiteral "${config.wayland.windowManager.hyprland.settings.decoration."rounding"}px";
        };

        "window" = {
          padding = mkLiteral "0";
          border = mkLiteral "1px solid";
          border-color = mkLiteral "@blue";
        };

        "listview" = {
          lines = mkLiteral "8";
          dynamic = true;
          fixed-height = false;
          scrollbar = true;
        };
      };
      plugins = with pkgs; [
        rofi-emoji
        rofi-calc
        rofi-power-menu
      ];
      modes = [
        "drun"
        "emoji"
      ];
      cycle = true;
    };
  };
}
