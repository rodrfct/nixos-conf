{ pkgs, ... }:

{
  programs.java = {
    enable = true;
  };

  home.packages = [
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
        local on_attach = function(_, bufnr)

          local bufmap = function(keys, func)
            vim.keymap.set('n', keys, func, { buffer = bufnr })
          end

          bufmap('<leader>r', vim.lsp.buf.rename)
          bufmap('<leader>a', vim.lsp.buf.code_action)

          bufmap('gd', vim.lsp.buf.definition)
          bufmap('gD', vim.lsp.buf.declaration)
          bufmap('gI', vim.lsp.buf.implementation)
          bufmap('<leader>D', vim.lsp.buf.type_definition)

          bufmap('gr', require('telescope.builtin').lsp_references)
          bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
          bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

          bufmap('K', vim.lsp.buf.hover)

          vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
          end, {})
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
        require'lspconfig'.kotlin_language_server.setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
        '';
      }
      nvim-treesitter-parsers.java
      nvim-treesitter-parsers.kotlin
    ];
  };
}
