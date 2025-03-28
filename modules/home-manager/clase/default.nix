{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    gnome-screenshot
    zip
    distrobox
    inputs.nix-alien.packages.${system}.nix-alien
  ];
}
