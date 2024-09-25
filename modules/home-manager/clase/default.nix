{ pkgs, ... }:

{
  imports = [
    ./pandoc/default.nix
    ./LMGSI.nix
    # ./PROG/PROG.nix
  ];

  home.packages = with pkgs; [
    gnome-screenshot
    zip
  ];
}
