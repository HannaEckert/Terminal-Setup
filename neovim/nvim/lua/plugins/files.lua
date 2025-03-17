return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>fo", ":Oil --float %:p:h %:p<CR>" },
	},
	config = function()
		require("oil").setup({
			keymaps = {
				["<esc>"] = "actions.close",
				["q"] = "actions.close",
			},
		})
	end,
}
