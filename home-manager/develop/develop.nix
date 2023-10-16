{ pkgs, inputs, ... }:

{

  imports = [
    ./vscode.nix
    ./nvim/neovim.nix
  ];

  home.packages = with pkgs; [
    bun
    fira-code
    fira-code-nerdfont
    firefox-devedition-bin
    nodePackages_latest.nodejs
    onefetch
    sqlite
    sqlitebrowser
    yq-go
  ];

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
  
}
