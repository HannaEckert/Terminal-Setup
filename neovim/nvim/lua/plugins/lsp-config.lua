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

			vim.filetype.add({
				extension = { cfm = "cf", cfc = "cf", cfs = "cf", bxm = "cf", bx = "cf", bxs = "cf" },
			})

			local lspconfig = require("lspconfig")
			local configs = require("lspconfig.configs")

			-- Add my custom cfml lsp
			if not configs.cfmlsp then
				configs.cfmlsp = {
					default_config = {
						cmd = { vim.fn.stdpath("config") .. "/cfmlsp/cfmlsp" },
						root_dir = lspconfig.util.root_pattern(".git", ".config"),
						filetypes = { "cf" },
					},
				}
			end

			lspconfig.cfmlsp.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.remark_ls.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>.", vim.lsp.buf.code_action, {})
		end,
	},
}
