return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua", "c", "vim", "vimdoc", "query", "javascript", "html",
				"java", "python", "bash", "cmake", "css", "dockerfile", "gitcommit",
				"markdown", "perl", "php", "python", "ruby", "sql", "toml",
				"typescript", "xml"
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true }
		})
	end
}
