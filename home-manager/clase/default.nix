{ pkgs, ... }:

{
  imports = [
    ./pandoc/default.nix
    ./LMGSI.nix
  ];
}
