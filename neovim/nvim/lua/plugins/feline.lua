return {
	{
		"kyazdani42/nvim-web-devicons",
		lazy = false,
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},
	{
		"freddiehaddad/feline.nvim",
		lazy = false,
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
