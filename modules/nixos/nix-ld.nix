{ pkgs, ... }:

{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libGL
    libGLX
    libX11
    libxkbcommon
    stdenv.cc.cc.lib  # libstdc++
  ];
}
