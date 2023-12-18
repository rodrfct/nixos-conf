{ pkgs, ... }:

{
  programs = {
    kitty = {
      enable = true;

      font = {
        name = "Fira Code";
        package = pkgs.fira-code-nerdfont;
        size = 10;
      };

      shellIntegration = {
        enableFishIntegration = true;
      };
    };
  };
}
