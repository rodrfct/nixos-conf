{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    firefox-esr
  ];

  # programs.firefox = {
  #   enable = true;
  #   package = pkgs.firefox-esr;
  #   profiles.default = {
  #
  #     search = {
  #       engines = {
  #         "Brave Search" = {};
  #       };
  #     };
  #
  #     settings = {
  #       "xpinstall.signatures.required" = false;
  #     };
  #   };
  # };

}
