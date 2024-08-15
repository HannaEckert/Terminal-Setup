return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})

		vim.keymap.set("n", "<leader>e", ":Neotree reveal left %:p:h:h %:p<CR>")
		vim.keymap.set("n", "<leader><tab>", ":Neotree buffers<CR>")
		vim.keymap.set("n", "<BS>", ":Neotree close<CR>")
	end,
}
