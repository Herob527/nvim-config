require("nvim-treesitter.configs").setup({
	ensure_installed = { "markdown" },
	auto_install = true,
	highlight = {
		enable = true,
	},
})

require("mason-lspconfig").setup({
	ensure_installed = { "marksman" },
})
require("mason-null-ls").setup({
	ensure_installed = { "markdownlint" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig")["marksman"].setup({
	capabilities = capabilities,
})

local null_ls = require("null-ls")

null_ls.register({
	sources = {
		null_ls.builtins.formatting.markdownlint,
		null_ls.builtins.diagnostics.markdownlint,
	},
})
