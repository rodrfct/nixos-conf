{ pkgs, config, ... }:

{
  programs = {
    kitty = {
      enable = true;

      # font = {
      #   name = "Fira Code Nerdfont";
        # package = pkgs.nerd-fonts.fira-code;
        # size = 10;
      # };

      shellIntegration = {
        enableFishIntegration = true;
      };
    };
  };
}
