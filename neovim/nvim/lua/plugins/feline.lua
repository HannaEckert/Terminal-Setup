return {
	{
		"freddiehaddad/feline.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
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
					local updates = lazyStatus.updates() .. " "
					return updates
				end,
				hl = {
					fg = frappe.maroon,
					bg = frappe.base,
				},
			})

			-- Disable the regular status line
			vim.o.showmode = false

			require("feline").setup({ components = components })
		end,
	},
}
