{ config, pkgs, ...}:

{

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      # Clipboard support
      xclip 
      wl-clipboard
      # Enhance telescope
      ripgrep # Mandatory
      fd
      chafa
      imagemagick
      poppler_utils
      # LSP
      luajitPackages.lua-lsp
      rnix-lsp
      typescript
      nodePackages_latest.typescript-language-server
      vscode-langservers-extracted
      nodePackages_latest.volar
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
        plugin = neovim-ayu;
        type = "lua";
        config = ''
        require('ayu').setup({})
        -- require('ayu').colorscheme()
        '';
      }
      {
        plugin = lualine-nvim;
        type = "lua";
        config = "require('lualine').setup()";
      }
      nvim-web-devicons
      {
        plugin = comment-nvim;
        type = "lua";
        config = "require('Comment').setup()";
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
      luasnip
      cmp_luasnip
      cmp-nvim-lsp

      {
        plugin = nvim-autopairs;
        type = "lua";
        config = "require('nvim-autopairs').setup()";
      }
      {
        plugin = toggleterm-nvim;
        type = "lua";
        config = ''
        require('toggleterm').setup{
          start_in_insert = true,
          hide_numbers = true,
        }

        vim.keymap.set('n', '<leader>tt', ':ToggleTerm<CR>', { buffer = bufnr })

        function _G.set_terminal_keymaps()
          local opts = {buffer = 0}
          vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
          vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
          vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
          vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
          vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
          vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
        '';
      }

      vim-nix
      neodev-nvim

      popup-nvim     
      telescope-media-files-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
        require('telescope').load_extension('media_files')
        require('telescope').setup({
          extensions = {
            media_files = {
              filetypes = {"png", "jpg", "jpeg", "svg", "webp", "ico"},
            }

          }
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols, {})
        
        vim.keymap.set('n', '<leader>fi', ':Telescope media_files<CR>', {})
        '';
      }

      {
        plugin = (nvim-treesitter.withPlugins (p: with p; [
          tree-sitter-nix
          tree-sitter-lua
          tree-sitter-markdown
          tree-sitter-css
          tree-sitter-html
          tree-sitter-javascript
          tree-sitter-typescript
          tree-sitter-json
          tree-sitter-vue
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
    ];

    extraLuaConfig = ''

    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '

    vim.o.clipboard = 'unnamedplus'

    vim.o.relativenumber = true

    vim.o.signcolumn = 'yes'

    vim.o.tabstop = 4
    vim.o.shiftwidth = 4

    vim.o.updatetime = 300

    vim.o.termguicolors = true

    vim.o.mouse = 'a'

    local bufmap = function(keys, func)
      vim.keymap.set('n', keys, func, { buffer = bufnr })
    end

    local ibufmap = function(keys, func)
      vim.keymap.set('i', keys, func, { buffer = bufnr })
    end
  
    bufmap('<leader>tn', ':tabn<CR>')
    bufmap('<leader>tp', ':tabp<CR>')

    ibufmap('<C-d>', '<C-d>zz')
    ibufmap('<C-u>', '<C-u>zz')

    ibufmap('<C-Right>', '<Esc>ea')
    ibufmap('<C-BS>', '<Esc>dba')

    -- This is so deep into my musle memory I can't get rid of it just yet
    bufmap('<C-s>', ':w<CR>')
    ibufmap('<C-s>', '<Esc>:w<CR>a')

    '';
  };
}
