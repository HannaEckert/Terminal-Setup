return {
	{
		"freddiehaddad/feline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local ctpFeline = require("catppuccin.groups.integrations.feline")
			local frappe = require("catppuccin.palettes").get_palette("frappe")

			ctpFeline.setup({
				assets = {
					left_separator = " ",
					right_separator = " ",
					mode_icon = "",
				},
				sett = { bkg = frappe.base },
			})

			local components = ctpFeline.get()
			local lazyStatus = require("lazy.status")

			-- Component for lazy.nvim upgrades
			table.insert(components.active[2], {
				enabled = lazyStatus.has_updates,
				provider = function()
					local updates = " " .. lazyStatus.updates() .. " "
					return updates
				end,
				hl = {
					fg = frappe.maroon,
					bg = frappe.base,
				},
			})

			components.active[3][3].provider = function()
				local filename = vim.fn.expand("%:t")
				local previousDirectory = vim.fn.expand("%:h:t")
				local extension = vim.fn.expand("%:e")

				local present, icons = pcall(require, "nvim-web-devicons")
				local icon = present and icons.get_icon(filename, extension) or "󰈔"

				if filename == "" then
					return " 󰹦 ..."
				end

				return " " .. icon .. " " .. previousDirectory .. "/" .. filename .. " "
			end

			-- Disable the regular status line
			vim.o.showmode = false

			require("feline").setup({ components = components })
		end,
	},
}
