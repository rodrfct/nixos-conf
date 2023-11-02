# First time I write something actually useful on my own, I feel a Nix wizard rn
{ pkgs }:

let
  fileContents = builtins.readFile ./akdmik.sh;
  shebangRemoved = builtins.replaceStrings [ "#! /bin/bash" ] [ "" ] fileContents;
  modifiedContents = builtins.replaceStrings [ "yq" ] [ "''${pkgs.yq-go}/bin/yq" ] shebangRemoved;
in
pkgs.writeShellScriptBin "akdmik" modifiedContents
