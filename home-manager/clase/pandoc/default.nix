{ pkgs, ... }:

{
  programs.pandoc = {
    enable = true;
    package = pkgs.pandoc;
  };

  home.packages = with pkgs; [
    python311Packages.weasyprint
    (import ./akdmik.nix {inherit pkgs;})
  ];
}
