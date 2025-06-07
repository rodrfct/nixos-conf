{ config , lib,  ... }:

with lib; {
  options.allowedUnfreePackages = mkOption {
    type = types.listOf types.str;
    default = [];
    description = "List of allowed unfree package names.";
  };

  config.nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (getName pkg) config.allowedUnfreePackages;
}
