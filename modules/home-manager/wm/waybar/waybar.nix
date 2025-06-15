{ pkgs, lib, osConfig,  ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {

        "network" = {
          "tooltip" = "false";
          "format-wifi" = "  {essid}";
          "format-ethernet" = "🌐";
        };

        "bluetooth" = {
          "tooltip-format-connected-battery" = "{device_battery_percentage}% 󰂯";
          "format-disabled" = "󰂲";
          "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
          "on-click" = "${lib.getExe pkgs.rofi-bluetooth}";
        };

        "cpu" = {
          "format" = " {usage}% {icon}";
          "format-icons" = [
            "<span color='#69ff94'></span>"
            "<span color='#2aa9ff'></span>"
            "<span color='#f8f8f2'></span>"
            "<span color='#f8f8f2'></span>"
            "<span color='#ffffa5'></span>"
            "<span color='#ffffa5'></span>"
            "<span color='#ff9977'></span>"
            "<span color='#dd532e'></span>"
          ];
        };

        "battery" = {
          "states" = {
            "good" = "95";
            "warning" = "30";
            "critical" = "20";
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{time} {icon}";
          "format-icons" = ["" "" "" "" ""];
        };

        "power-profiles-daemon" = {
          "format" = "{icon}";
          "format-icons" = {
            "default" = "";
            "performance" = "";
            "balanced" = "";
            "power-saver" = "";
          };
        };

      };

    };
  };
}
