{ inputs, pkgs, ... }:
{
  # Flake cache
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
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
      libnotify
      mako
      rofi-wayland
      hyprpolkitagent
      libsForQt5.qt5.qtwayland
    ];

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

  };

}
