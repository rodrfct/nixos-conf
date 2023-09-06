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
      open-vsx.vue.volar
      open-vsx.pkief.material-icon-theme
      open-vsx.sndst00m.vscode-native-svg-preview
      open-vsx.shd101wyy.markdown-preview-enhanced
      open-vsx.jnoortheen.nix-ide
      #open-vsx.rust-lang.rust-analyzer
      #vscode-marketplace.vue.vscode-typescript-plugin
      open-vsx.antfu.theme-vitesse
      open-vsx.teabyii.ayu
    ];
  };
  
}