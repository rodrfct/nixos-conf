{ pkgs, ... }:

{
  imports = [
    ./obs.nix
  ];

  environment.systemPackages = with pkgs; [
    kdePackages.kdenlive
  ];

  services.flatpak.enable = true;
}
