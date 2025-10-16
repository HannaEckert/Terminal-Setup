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
			-- Add Mason bin to PATH
			vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

			vim.lsp.config["*"] = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			}

			-- per server overrides
			vim.lsp.config("ts_ls", {
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
				end,
			})

			vim.lsp.config("eslint", {
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = true
				end,
				settings = {
					format = true,
					packageManager = "npm",
				},
			})

			vim.lsp.config("clangd", {
				cmd = { "clangd", "--enable-config" },
			})

			-- enable all
			vim.lsp.enable({
				"arduino_language_server",
				"lua_ls",
				"ts_ls",
				"eslint",
				"bashls",
				"cssls",
				"sqls",
				"jdtls",
				"clangd",
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
