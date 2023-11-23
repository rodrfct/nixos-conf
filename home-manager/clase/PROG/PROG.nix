{ pkgs, ... }:

{
  programs.java = {
    enable = true;
  };

  home.packages = [
    pkgs.netbeans
    pkgs.gradle
    (import ./patch_gradle_libnativeplatform.nix {inherit pkgs;})
  ];

  programs.neovim = {
    extraPackages = with pkgs; [
      java-language-server
      kotlin-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
        -- Java LS
        require('lspconfig').java_language_server.setup {
          on_attach = on_attach,
          capabilities = capabilities,
          root_dir = function()
            return vim.loop.cwd()
          end,
          
          cmd = {"java-language-server"},
        }

        -- Kotlin LS
        require'lspconfig'.kotlin_language_server.setup{}
        '';
      }
      nvim-treesitter-parsers.java
      nvim-treesitter-parsers.kotlin
    ];
  };
}
