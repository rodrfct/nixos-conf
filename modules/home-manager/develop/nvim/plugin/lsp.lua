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

vim.lsp.config('lua_ls', {
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
})

vim.lsp.config('nixd', {
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.config('jsonls', {
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.config('html', {
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
})

vim.lsp.config('cssls', {
	on_attach = on_attach,
	capabilities = capabilities,
})

local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }

vim.lsp.config('vtsls', {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = '@vue/typescript-plugin',
						location = "vue_lsPkg/lib/language-tools/packages/language-server",
						languages = { 'vue' },
						configNamespace = 'typescript',
					}
				},
			},
		},
	},
	filetypes = tsserver_filetypes,
})

vim.lsp.config('rust_analyzer', {
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
})

vim.lsp.config('java_language_server', {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = function()
		return vim.loop.cwd()
	end,

	cmd = {"java-language-server"},
})

vim.lsp.config('kotlin_language_server', {
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable({'lua_ls', 'nixd', 'jsonls', 'cssls', 'html', 'vue_ls', 'vtsls', 'rust_analyzer', 'java_language-server', 'kotlin_language-server'})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

