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
			use_popups_for_input = false,
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
			window = {
				mappings = {
					["<leader>se"] = "close_window",
				}
			}
		})

		vim.keymap.set("n", "<leader>se", ":Neotree toggle left %:p:h:h %:p<CR>")
	end,
}
