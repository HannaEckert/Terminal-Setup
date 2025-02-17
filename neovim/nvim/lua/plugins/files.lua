return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			keymaps = {
				["<esc>"] = "actions.close",
				["q"] = "actions.close",
			}
		})
		vim.keymap.set("n", "<leader>fo", ":Oil --float %:p:h %:p<CR>")
	end,
}
