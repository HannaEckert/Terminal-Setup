return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true
		}
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.html.setup({})
			lspconfig.bashls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.cssls.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.remark_ls.setup({})
			lspconfig.sqls.setup({})
			lspconfig.pyre.setup({})
			lspconfig.lemminx.setup({})

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
		end
	}
}
