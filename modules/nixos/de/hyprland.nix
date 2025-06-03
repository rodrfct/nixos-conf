{ inputs, pkgs, lib, config, ... }:

{
  options = {
    hyprland = {
      autostart = lib.mkEnableOption "Autostart Hyprland on login";
    };
  };

  config = {

    # Flake cache
    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

    programs.bash.loginShellInit = lib.mkIf config.hyprland.autostart ''
    if uwsm check may-start; then
      exec uwsm start hyprland.desktop
    fi
    '';

    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      withUWSM = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };

    environment = {
      systemPackages = with pkgs; [
        kitty
        nautilus
        libnotify
        hyprshot
        waybar
        mako
        rofi-wayland
        hyprpolkitagent
        libsForQt5.qt5.qtwayland
        kdePackages.qtwayland
      ];

      sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };

    };

  };
}
