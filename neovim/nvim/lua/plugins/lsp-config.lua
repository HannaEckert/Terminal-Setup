return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"html",
					"bashls",
					"cssls",
					"jsonls",
					"remark_ls",
					"jdtls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		events = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.remark_ls.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "gr", vim.lsp.buf.references)
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action)
			vim.keymap.set("n", "gs", vim.lsp.buf.workspace_symbol)
			vim.keymap.set("n", "<leader>K", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)
		end,
	},
	{
		"hannaeckert/cfmlsp.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = {},
	},
	{
		"hannaeckert/boxlsp.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = {},
	},
}
