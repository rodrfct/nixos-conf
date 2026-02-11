{ pkgs, config, ...}:

{
  stylix = {
    enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";

    polarity = "dark";

    opacity = {
      applications = 1.0;
      terminal = 0.85;
      desktop = config.stylix.opacity.terminal;
      popups = config.stylix.opacity.terminal;
    };

    fonts = {
      serif = config.stylix.fonts.sansSerif;
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto";
      };
      # monospace = {
      #   package = pkgs.nerd-fonts.fira-code;
      #   name = "Fira Code Nerdfont";
      # };
      monospace = {
        package = pkgs.nerd-fonts.gohufont;
        name = "Gohu";
      };
      sizes.terminal = 11;
    };

    cursor = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 26;
    };
  };
}
