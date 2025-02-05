return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"catppuccin/nvim",
		},
		config = function()
			local lualine = require("lualine")
			local catppuccin = require("catppuccin.palettes").get_palette("frappe")
			local theme = require("lualine.themes.catppuccin-frappe")

			-- Component for filename with icon
			local filename_with_icon = {
				function()
					local filename = vim.fn.expand("%:t")
					local previousDirectory = vim.fn.expand("%:h:t")
					local extension = vim.fn.expand("%:e")

					local present, icons = pcall(require, "nvim-web-devicons")
					local icon = present and icons.get_icon(filename, extension) or "󰈔"

					if filename == "" then
						return " 󰹦 ..."
					end

					return " " .. icon .. " " .. previousDirectory .. "/" .. filename .. " "
				end,
				color = { fg = catppuccin.yellow },
			}

			-- Removing the background from section b and y
			theme.normal.b.bg = catppuccin.base
			theme.insert.b.bg = catppuccin.base
			theme.visual.b.bg = catppuccin.base
			theme.replace.b.bg = catppuccin.base
			theme.command.b.bg = catppuccin.base
			theme.inactive.b.bg = catppuccin.base

			-- Lualine setup
			lualine.setup({
				options = {
					theme = theme,
					section_separators = { left = " ", right = " " },
					component_separators = { left = " ", right = " " },
					always_divide_middle = false,
					globalstatus = true,
				},
				sections = {
					lualine_a = {},
					lualine_b = { { function() return "" end }, "location" },
					lualine_c = { "diff", "diagnostics" },
					lualine_x = { "mason", "lazy" },
					lualine_y = { filename_with_icon, "branch" },
					lualine_z = {},
				},
			})
		end,
	},
}
