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
			},
		})

		-- Setup syntax highlighting
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			pattern = { "*.cfm", "*.cfc", "*.cfs", "*.bxm", "*.bx", "*.bxs" },
			callback = function()
				vim.cmd("setlocal syntax=cf")
				vim.o.signcolumn = "yes"
			end,
		})

		-- treat *.code-snippets like json files
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			pattern = "*.code-snippets",
			callback = function()
				vim.cmd("setlocal syntax=json")
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

		parserConfig.cfhtml = {
			install_info = {
				url = "https://github.com/cfmleditor/tree-sitter-cfml",
				files = { "src/parser.c", "src/scanner.c" },
				location = "cfhtml",
			},
			filetype = "cfml",
		}

		parserConfig.cfscript = {
			install_info = {
				url = "https://github.com/cfmleditor/tree-sitter-cfml",
				files = { "src/parser.c", "src/scanner.c" },
				location = "cfscript",
			},
			filetype = "cfml",
		}

		configs.setup({
			modules = {},
			ignore_install = {},
			ensure_installed = {
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
				"cfhtml",
				"cfscript",
				"dockerfile",
				"gitcommit",
				"sql",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				disable = { "cfml", "cfhtml", "cfscript" },
			},
			indent = { enable = true },
			textobjects = { enable = true },
		})
	end,
}
