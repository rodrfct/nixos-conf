{ config, pkgs, ... }:
{
  imports = [
    ../../kitty.nix
    ../waybar.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    settings = {
      "$mod" = "SUPER";
      "$menu" = "rofi -show drun -show-icons";
      "$terminal" = "kitty";

      exec-once = [
        "uwsm app -- mako"
      ];

      decoration = {
        "rounding" = "5";
        "dim_inactive" = "true";
        "dim_strength" = "0.2";
      };

      bind =
        [
          # "$mod, F, exec, firefox"
          "$mod, B, exec, brave"
          "$mod, T, exec, $terminal"
          "$mod, a, exec, $menu"

          "$mod, PRINT, exec, hyprshot -m region"
          " , PRINT, exec, hyprshot -m output"
          "$mod + SHIFT, PRINT, exec, hyprshot -m window"
        ] ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );

    gestures = {};

    input = {
      "kb_layout" = "es";
      "accel_profile" = "flat";
      "follow_mouse" = "2";

      touchpad = {
        "natural_scroll" ="true";
      };

    };

    };

    plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];
  };

  services = {
    mako = {
      enable = true;
      settings = {
        border-radius = config.wayland.windowManager.hyprland.settings.decoration."rounding";
      };
    };
  };


}
