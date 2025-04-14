{ pkgs,... }:

{

  imports = [
    ./vscode.nix
    ./nvim/neovim.nix
    ../kitty.nix
  ];

  home.packages = with pkgs; [
    brave # Test for chromium
    fira-code
    nerd-fonts.fira-code
    firefox-devedition
    onefetch
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

      commit = {
        verbose = true;
      };

      url = {
        "https://github.com/" = {
          insteadOf = [
            "gh:"
            "github:"
          ];
        };

      };

    };
  };

}
