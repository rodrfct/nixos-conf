{ pkgs,... }:

{

  imports = [
    ./nvim/neovim.nix
    ../kitty.nix
  ];

  home.packages = with pkgs; [
    fira-code
    nerd-fonts.fira-code
    onefetch
  ];

  # basic configuration of git
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "rodrfct";
        email = "rodrigoca.fct@gmail.com";
      };

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
