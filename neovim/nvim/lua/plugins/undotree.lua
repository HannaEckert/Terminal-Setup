return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local undotree = require("undotree")
		undotree.setup({})

		vim.keymap.set({ "n", "v" }, "<leader>u", undotree.toggle)
	end,
}
