return {
	{
		"freddiehaddad/feline.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			local components = require("catppuccin.groups.integrations.feline").get()
			local lazyStatus = require("lazy.status")

			-- Component for lazy.nvim upgrades
			table.insert(components.active[2], {
				enabled = lazyStatus.has_updates,
				provider = function()
					local updates = lazyStatus.updates() .. " "
					return updates
				end,
				hl = {
					fg = "#ea999c",
					bg = "#232634",
					style = "bold",
				},
			})

			require("feline").setup({
				components = components,
			})
		end,
	},
}
