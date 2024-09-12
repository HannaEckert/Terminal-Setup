return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		local theme = require("alpha.themes.theta")

		theme.buttons.val = {
			{ type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
			{ type = "padding", val = 1 },
			dashboard.button("e", "  New file", "<cmd>ene<CR>"),
			dashboard.button("SPC f f", "󰈞  Find file"),
			dashboard.button("SPC f g", "󰊄  Live grep"),
			dashboard.button("c", "  Configuration", "<cmd>cd ~/.config/nvim/<CR><cmd>Neotree<CR>"),
			dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
			dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
		}

		require("alpha").setup(theme.config)
	end,
}
