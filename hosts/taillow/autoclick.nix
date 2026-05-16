{ pkgs, ... }:
{
  programs.ydotool.enable =true;
  programs.ydotool.group = "wheel";

  # systemd.services.weekday-click = {
  #   description = "Weekday automated mouse click";
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.ydotool}/bin/ydotool click C0'";
  #   };
  # };
  #
  # systemd.timers.weekday-click = {
  #   description = "Mouse click Mon–Fri at 17:00";
  #   wantedBy = [ "timers.target" ];
  #   timerConfig = {
  #     OnCalendar = "Mon..Fri *-*-* 18:51:00";
  #     Persistent = true;
  #   };
  # };
}
