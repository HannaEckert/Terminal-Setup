return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			local parserConfig = require("nvim-treesitter.parsers").get_parser_configs()

			-- Add CFML parser
			parserConfig.cfml = {
				install_info = {
					url = "https://github.com/cfmleditor/tree-sitter-cfml",
					files = { "src/parser.c", "src/scanner.c" },
					location = "cfml",
				},
				filetype = "cfml", -- Filetype in Neovim to associate with the parser
			}

			configs.setup({
				modules = {},
				ignore_install = {},
				ensure_installed = {
					"lua",
					"c",
					"vim",
					"vimdoc",
					"query",
					"javascript",
					"html",
					"java",
					"python",
					"bash",
					"cmake",
					"css",
					"dockerfile",
					"gitcommit",
					"markdown",
					"perl",
					"php",
					"python",
					"ruby",
					"sql",
					"toml",
					"typescript",
					"xml",
					"cfml",
				},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-treesitter/playground",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
