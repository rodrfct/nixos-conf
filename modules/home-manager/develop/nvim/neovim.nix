{ config, pkgs, ...}:

{
  stylix.targets.neovim.enable = false;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      nodePackages_latest.prettier
      # Clipboard support
      xclip 
      wl-clipboard
      # Enhance telescope
      ripgrep # Mandatory
      fd
      chafa
      imagemagick
      poppler-utils
      ueberzugpp
      # LSP
      luajitPackages.lua-lsp
      nixd
      # Treesitter
      tree-sitter
      vimPlugins.nvim-treesitter-parsers.tsx
      vimPlugins.nvim-treesitter-parsers.java
      vimPlugins.nvim-treesitter-parsers.kotlin
    ];

    extraLuaPackages = ps: [
      ps.magick
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.replaceStrings ["vue_lsPkg"] ["${pkgs.vue-language-server}"] (builtins.readFile ./plugin/lsp.lua);
      }
      {
        plugin = nord-nvim;
        # config = "colorscheme nord";
      }
      {
        plugin = catppuccin-nvim;
        config = "colorscheme catppuccin-mocha";
      }
      {
        plugin = neovim-ayu;
        type = "lua";
        config = ''
        local colors = require('ayu.colors')
        colors.generate()

        require('ayu').setup({
          overrides = {
            Type = { fg = colors.accent },
          }
        })
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
        plugin = neogit;
        type = "lua";
        config = ''require('neogit').setup {
          kind = "floating"
        }'';
      }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile ./plugin/cmp.lua;
      }
      luasnip
      cmp_luasnip
      cmp-nvim-lsp
      cmp-path

      {
        plugin = nvim-autopairs;
        type = "lua";
        config = "require('nvim-autopairs').setup()";
      }
      {
        plugin = vim-visual-multi;
        type = "lua";
        config = ''
        vim.g.VM_maps = {
            ["I BS"] = "", -- disable backspace mapping to avoid conflict with nvim-autopairs
          }
        '';
      }
      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = "require('ibl').setup {scope = {enabled = true},}";
      }
      vim-prettier
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

      {
        plugin = image-nvim;
        type = "lua";
        config = ''
          require('image').setup {
            backend = "kitty",
            integrations = {
              markdown = {
                only_render_image_at_cursor = true,
              },
            },
            window_overlap_clear_enabled = true,
          }
        '';
      }
      popup-nvim     
      telescope-media-files-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
        require('telescope').load_extension('media_files')
        require('telescope').setup({
          pickers = {
            find_files = {
              find_command = {"rg", "--files", "--no-ignore", "--hidden"}
            },
          },
          extensions = {
            media_files = {
              filetypes = {"png", "jpg", "jpeg", "svg", "webp", "ico", "pdf"},
            }

          }
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})
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
          tree-sitter-xml
          tree-sitter-javascript
          tree-sitter-typescript
          tree-sitter-json
          tree-sitter-vue
        ]));
        type = "lua";
        config = ''
        require'nvim-treesitter'.setup {
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
    vim.o.number = true

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
  
    bufmap('<C-d>', '<C-d>zz')
    bufmap('<C-u>', '<C-u>zz')

    ibufmap('<C-Right>', '<Esc>ea')

    -- This is so deep into my musle memory I can't get rid of it just yet
    bufmap('<C-s>', ':w<CR>')
    ibufmap('<C-s>', '<Esc>:w<CR>a')

    '';

    extraConfig = ''
      set guicursor+=a:blinkon1
      set autoread
    '';
  };
}
