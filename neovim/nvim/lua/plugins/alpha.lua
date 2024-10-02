return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")

		startify.section.top_buttons.val = {}
		startify.section.mru.val = {}

		startify.section.mru_cwd.val[2].val = function()
			local recentFilesCount = #startify.section.mru_cwd.val[4].val()[1].val
			local headline = "R e c e n t   F i l e s"
			if recentFilesCount == 0 then
				headline = "N o   " .. headline
			end

			return headline
		end

		startify.section.bottom_buttons.val = {
			{ type = "padding", val = 1 },
			{
				type = "text",
				val = function()
					return "S h o r t c u t s"
				end,
				opts = { hl = "SpecialComment", shrink_margin = false },
			},
			{ type = "padding", val = 1 },
			{
				type = "group",
				val = {
					startify.button("e", "                   New file", "<cmd>ene<CR>"),
					startify.button("SPC f f", "           󰈞  Find file"),
					startify.button("SPC f g", "           󰊄  Live grep"),
					startify.button(
						"c",
						"                   Configuration",
						"<cmd>cd ~/.config/nvim/<CR><cmd>Neotree<CR>"
					),
					startify.button("u", "                   Update plugins", "<cmd>Lazy sync<CR>"),
					startify.button("q", "                 󰅚  Quit NVIM", ":qa<CR>"),
				},
			},
		}

		alpha.setup(startify.config)
	end,
}
