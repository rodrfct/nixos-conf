{ config, pkgs, inputs, ... }:

{
  # basic configuration of git
  programs.git = {
    enable = true;
    userName = "rodrfct";
    userEmail = "rodrigoca.fct@gmail.com";

    extraConfig = {
    	init = {
    		defaultBranch = "master";
    	};
    };
  };

  programs.vscode = {
  	enable = true;
  	package = pkgs.vscodium;

  	userSettings = {
  	  "editor.fontFamily" = "'Fira Code', 'monospace', monospace";
  	  "editor.fontLigatures" = true;
  	  "window.menuBarVisibility" = "toggle";
  	  "workbench.colorTheme" = "Vitesse Dark";
  	  "workbench.iconTheme" = "material-icon-theme";
  	  "workbench.startupEditor" = "none";
  	};

    extensions = with inputs.nix-vscode-extensions.extensions.x86_64-linux; [
      # Language support
      open-vsx.jnoortheen.nix-ide
      open-vsx.vue.volar
      open-vsx.zixuanchen.vitest-explorer
      # Utilities
      open-vsx.shd101wyy.markdown-preview-enhanced
      open-vsx.sndst00m.vscode-native-svg-preview
      # Color themes
      open-vsx.antfu.theme-vitesse
      open-vsx.teabyii.ayu
      # Icon themes
      open-vsx.pkief.material-icon-theme
    ];
  };
  
}
