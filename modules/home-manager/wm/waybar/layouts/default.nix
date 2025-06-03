{ lib, pkgs, ... }:

{
  programs.waybar.settings = {
    mainBar = {
      modules-left = [ "group/group-power" "cpu" "temperature" ];
      modules-center = [ "clock" "hyprland/workspaces" ];
      modules-right = [
        "tray"
        # "network"
        "custom/network-manager"
        "battery"
        "backlight"
        "bluetooth"
        "pulseaudio"
        "power-profiles-daemon" 
      ];

      "temperature" = {
        "thermal-zone" = "2";
        "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
        "critical-threshold" = "80";
        "format-critical" = "{temperatureC}°C!!!! {icon}";
        "format" = "{icon} {temperatureC}°C";
        "format-icons" = [ "" ];
      };

      "pulseaudio" = {
        "tooltip" = false;
        "scroll-step" = "5";
        "format" = "{icon} {volume}%";
        "format-muted" = "{icon} {volume}%";
        "on-click" = "";
        "format-icons" = {
          "default" = ["" "" ""];
        };
      };

      "custom/network-manager" = {
        "exec" = "${lib.getExe pkgs.rofi-network-manager} --status --disabled-color \"#f38ba8\" --enabled-color \"#a6e3a1\" | cat";
        "return-type" = "raw";
        "format" = "{}  ";
        "interval" = 3;
        "rotate" = 0;
        "on-click" = "${lib.getExe pkgs.rofi-network-manager}";
        "tooltip" = false;
      };



      "custom/os-button" = {
        "format" = "";
        # "on-click" = "";
        "tooltip" = false;
      };

      "custom/quit" = {
        "format" = "󰗼";
        "tooltip" = false;
        "on-click" = "hyprctl dispatch exit";
      };

      "custom/reboot" = {
        "format" = "󰜉";
        "tooltip" = false;
        "on-click" = "reboot";
      };

      "custom/power" = {
        "format" = "";
        "tooltip" = false;
        "on-click" = "shutdown now";
      };

      "group/group-power" = {
        "orientation" = "inherit";
        "drawer" = {
          "transition-duration" = 500;
          "children-class" = "not-power";
          "click-to-reveal" = true;
          "start-collapsed" = false;
        };
        "modules" = [
          "custom/os-button"
          "custom/power"
          "custom/quit"
          "custom/reboot"
        ];
      };

    };
  };

  programs.waybar.style = ''
    .not-power, .not-power * {
      margin: 0 5px;
    }

    .not-power >:first-child {
      margin-left: 10px;
    }
  '';
}
