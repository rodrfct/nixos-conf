{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    nil # Nix LSP
    nixpkgs-fmt
  ];

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
  	  # Extensions
  	  "markdown-preview-enhanced.previewTheme" = "github-dark.css";

      # Nix LSP
      "nix.enableLanguageServer" = true;
      #"nix.serverPath" = "rnix-lsp";
      "nix.serverPath" = "nil";
      #"nix.serverPath": "nixd"
  	};

    extensions = with inputs.nix-vscode-extensions.extensions.x86_64-linux; [
      # Language support
      open-vsx.jnoortheen.nix-ide
      open-vsx.vue.volar
      # Utilities
      open-vsx.shd101wyy.markdown-preview-enhanced
      open-vsx.sndst00m.vscode-native-svg-preview
      open-vsx.yandeu.five-server
      # Color themes
      open-vsx.antfu.theme-vitesse
      open-vsx.teabyii.ayu
      # Icon themes
      open-vsx.pkief.material-icon-theme
    ];

    languageSnippets = {
      vue = {
        "Script setup with Typescript" = {
          "prefix" = "script:ts";
          "body" = [
            "<script setup lang=\"ts\">"
            "$0"
            "</script>"
          ];
        };

        "Template" = {
          "prefix" = "template";
          "body" = [
            "<template>"
            "\t$0"
            "</template>"
          ];
        };
      };

    };
  };
}
