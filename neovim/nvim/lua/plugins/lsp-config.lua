return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		ft = vim.g.coding_file_types,
		config = function()
			require("mason").setup({
				ui = { border = "rounded" },
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"arduino_language_server",
					"lua_ls",
					"ts_ls",
					"eslint",
					"bashls",
					"cssls",
					"sqls",
					"jdtls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		ft = vim.g.coding_file_types,
		events = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.arduino_language_server.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
				end,
			})
			lspconfig.eslint.setup({
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
				settings = {
					format = true,
					packageManager = "npm"
				}
			})
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.sqls.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({
				cmd = { "clangd", "--enable-config" },
				capabilities = capabilities,
			})

			-- Jump to code
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
			vim.keymap.set("n", "gr", vim.lsp.buf.references)
			vim.keymap.set("n", "gs", vim.lsp.buf.workspace_symbol)
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)

			-- Jumping betwen diagnostics
			vim.keymap.set("n", "[d", function() -- previous
				vim.diagnostic.jump({ count = -1 })
			end)
			vim.keymap.set("n", "]d", function() -- next
				vim.diagnostic.jump({ count = 1 })
			end)

			-- Show info
			vim.keymap.set("n", "gl", vim.lsp.buf.list_workspace_folders)
			vim.keymap.set("n", "gk", vim.lsp.buf.hover)
 			vim.keymap.set("n", "<leader>K", function() vim.diagnostic.open_float({ border = "rounded" }) end)
			vim.keymap.set("n", "gS", vim.lsp.buf.signature_help)

			-- Quick actions
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format)
			vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename)
			vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action)
		end,
	},
	{
		"hannaeckert/cfmlsp.nvim",
		ft = { "cfml", "cfscript" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},

		opts = {},
	},
	{
		"hannaeckert/boxlsp.nvim",
		ft = { "boxlang" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = {},
	},
}
