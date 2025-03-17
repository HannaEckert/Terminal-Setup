return {
	{
		"nvimtools/none-ls.nvim",
		ft = vim.g.coding_file_types,
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.sql_formatter,
					require("none-ls.diagnostics.eslint"),
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		ft = vim.g.coding_file_types,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"stylua",
					"jq",
					"eslint_d",
					"sql-formatter",
				},
				automatic_installation = true,
			})
		end,
	},
}
