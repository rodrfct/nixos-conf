-- Literally copied from Vimjoyer
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

require('neodev').setup()
require('lspconfig').lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = function()
		return vim.loop.cwd()
	end,
	cmd = { "lua-lsp" },
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	}
}

require('lspconfig').nixd.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- This part is mine

require('lspconfig').html.setup {
	on_attach = on_attach,
	capabilities = capabilities,

	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true
		},
		provideFormatter = true
	}
}

require('lspconfig').cssls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

require('lspconfig').ts_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

require('lspconfig').volar.setup {
	on_attach = on_attach,
	capabilities = capabilities,

	cmd = { "vue-language-server", "--stdio" },
	init_options = {
		vue = {
			-- disable hybrid mode
			hybridMode = false,
		},
	},
}

require('lspconfig').rust_analyzer.setup {
	on_attach = on_attach,
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true;
				experimental = {
					enable = true;
				}
			}
		}
	},
}

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

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

