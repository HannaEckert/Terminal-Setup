return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			integrations = {
				harpoon = true,
				headlines = true,
				noice = true,
				notify = true,
				nvim_surround = true,
				dadbod_ui = true,
			}
		})

		vim.cmd.colorscheme("catppuccin-frappe")
	end,
}
