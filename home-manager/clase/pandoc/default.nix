{ pkgs, inputs, ... }:

{
  programs.pandoc = {
    enable = true;
    package = pkgs.pandoc;
  };

  home.packages = with pkgs; [
    python311Packages.weasyprint
    (import ./akdmik.nix {inherit pkgs inputs;})
  ];

  home.file."css" = {
    recursive = true;
    source = "${inputs.pandoc-setup}/css";
    target = ".local/share/pandoc/css";
  };
  
  home.file."js" = {
    recursive = true;
    source = "${inputs.pandoc-setup}/js";
    target = ".local/share/pandoc/js";
  };

  home.file."templates" = {
    recursive = true;
    source = "${inputs.pandoc-setup}/templates";
    target = ".local/share/pandoc/templates";
  };

  home.file."defaults" = {
    recursive = true;
    source = "${inputs.pandoc-setup}/defaults";
    target = ".local/share/pandoc/defaults";
  };

}
