{ pkgs, inputs, ... }:

{
  programs.pandoc = {
    enable = true;
    package = pkgs.pandoc;
  };

  home.packages = with pkgs; [
    python311Packages.weasyprint
    (import ./akdmik.nix {inherit pkgs inputs;})
    # Fonts
    prociono # Roman replacement
    fanwood # The one I personally like the most
    orbitron # I finally found the libre Zekton clone
  ];

  home.file."pandoc" = {
    recursive = true;
    source = "${inputs.pandoc-setup}";
    target = ".local/share/pandoc";
  };

}
