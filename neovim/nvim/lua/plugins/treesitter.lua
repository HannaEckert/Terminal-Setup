return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		---@class ParserInfo
		local parserConfig = require("nvim-treesitter.parsers").get_parser_configs()

		-- Add cfml and boxlang filetypes
		vim.filetype.add({
			extension = {
				cfm = "cfml",
				cfc = "cfml",
				cfs = "cfml",
				bxm = "boxlang",
				bx = "boxlang",
				bxs = "boxlang",
				["code-snippets"] = "json",
			},
		})

		-- Enable spell-checking within markdown files per default
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			pattern = "*.md",
			callback = function()
				vim.cmd("setlocal spell spelllang=en")
			end,
		})

		parserConfig.cfml = {
			install_info = {
				url = "https://github.com/cfmleditor/tree-sitter-cfml",
				files = { "src/parser.c", "src/scanner.c" },
				location = "cfml",
			},
			filetype = "cfml",
		}

		parserConfig.cfscript = {
			install_info = {
				url = "https://github.com/cfmleditor/tree-sitter-cfml",
				files = { "src/parser.c", "src/scanner.c" },
				location = "cfscript",
			},
		}

		configs.setup({
			modules = {},
			ignore_install = {},
			ensure_installed = {
				"query",
				"lua",
				"bash",
				"markdown",
				"xml",
				"json",
				"html",
				"css",
				"javascript",
				"java",
				"cfml",
				"cfscript",
				"dockerfile",
				"gitcommit",
				"sql",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",

						["aa"] = "@assignment.outer",
						["ia"] = "@assignment.inner",
						["la"] = "@assignment.lhs",
						["ra"] = "@assignment.rhs",

						["ac"] = "@comment.outer",
						["ic"] = "@comment.inner",

						["as"] = "@spec.outer",
						["is"] = "@spec.inner",

						["at"] = "@test.outer",
						["it"] = "@test.inner",
					},
					selection_modes = {
						["@function.outer"] = "V",
					},
				},
			},
		})
	end,
}
