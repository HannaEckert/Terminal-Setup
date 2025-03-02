return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")

		local function getCharLen(s, pos)
			local byte = string.byte(s, pos)
			if not byte then
				return nil
			end
			return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
		end

		local function applyColors(logo, colors, logoColors)
			startify.section.header.val = logo

			for key, color in pairs(colors) do
				local name = "Alpha" .. key
				vim.api.nvim_set_hl(0, name, color)
				colors[key] = name
			end

			startify.section.header.opts.hl = {}
			for i, line in ipairs(logoColors) do
				local highlights = {}
				local pos = 0

				for j = 1, #line do
					local opos = pos
					pos = pos + getCharLen(logo[i], opos + 1)

					local color_name = colors[line:sub(j, j)]
					if color_name then
						table.insert(highlights, { color_name, opos, pos })
					end
				end

				table.insert(startify.section.header.opts.hl, highlights)
			end
		end

		applyColors({
			[[   ]],
			[[    n   e       v   i   m    ]],
		}, {
			["a"] = { fg = "#51576d" }, -- gray / surface 1
			["b"] = { fg = "#e5c890" }, -- yellow
		}, {
			[[ a ]],
			[[    a   a   bb   a   a   a    ]],
		})

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
