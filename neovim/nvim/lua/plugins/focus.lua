return {
	"nvim-focus/focus.nvim",
	version = "*",
	config = function()
		require("focus").setup({
			autoresize = {
				minwidth = 20,
				minheight = 20,
			},
			ui = {
				cursorline = false,
				signcolumn = false,
			},
		})

		-- Initially disable this feature
		vim.cmd("silent FocusDisable")

		vim.keymap.set({ "n", "v" }, "<leader>wf", "<cmd>FocusToggle<cr><cmd>FocusMaximise<cr>", { silent = true })
	end,
}
