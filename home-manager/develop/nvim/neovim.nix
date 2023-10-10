{ config, pkgs, ...}:

{

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      # LSP
      luajitPackages.lua-lsp
      rnix-lsp
      typescript
      nodePackages_latest.typescript-language-server
      vscode-langservers-extracted
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile ./plugin/lsp.lua;
      }
      {
        plugin = nord-nvim;
        config = "colorscheme nord";
      }
      {
        plugin = comment-nvim;
        type = "lua";
        config = "require(\"Comment\").setup()";
      }
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = "require('gitsigns').setup()";
      }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile ./plugin/cmp.lua;
      }
      cmp_luasnip
      cmp-nvim-lsp

      {
        plugin = nvim-autopairs;
        type = "lua";
        config = "require('nvim-autopairs').setup()";
      }
      
      luasnip
      friendly-snippets

      vim-nix
      neodev-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
        require('telescope').setup()
        '';
      }

      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-lua
          p.tree-sitter-css
          p.tree-sitter-html
          p.tree-sitter-javascript
          p.tree-sitter-typescript
          p.tree-sitter-json
          p.tree-sitter-vue
        ]));
        type = "lua";
        config = ''
        require('nvim-treesitter.configs').setup {
          ensure_installed = {},

          auto_install = false,

          highlight = { enable = true },

          indent = { enable = true },
        }
        '';
      }
      nvim-treesitter-parsers.vue
    ];

    extraLuaConfig = ''

    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '

    vim.o.clipboard = 'unnamedplus'

    vim.o.number = true
    -- vim.o.relativenumber = true

    vim.o.signcolumn = 'yes'

    vim.o.tabstop = 4
    vim.o.shiftwidth = 4

    vim.o.updatetime = 300

    vim.o.termguicolors = true

    vim.o.mouse = 'a'

    '';
  };
}
