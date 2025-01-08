return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")

		startify.section.header.val = ""
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
					startify.button("e", "  New File", "<cmd>ene<cr>"),
					startify.button("f", "󰈞  Find File", "<cmd>Telescope find_files<cr>"),
					startify.button("g", "󰊄  Live Grep", "<cmd>Telescope live_grep_args<cr>"),
					startify.button("o", "  Open Folder", "<cmd>Oil --float<cr>"),
					{ type = "padding", val = 1 },
					startify.button("c", "  Configuration", "<cmd>cd ~/.config/nvim/<cr><cmd>Oil --float<cr>"),
					startify.button("u", "󰚰  Update Plugins", "<cmd>Lazy sync<cr>"),
					startify.button("q", "󰅚  Quit Neovim", "<cmd>qa<cr>"),
				},
			},
		}

		startify.config.opts.margin = 5
		alpha.setup(startify.config)
	end,
}
