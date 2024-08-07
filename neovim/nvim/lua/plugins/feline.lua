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
			require("feline").setup({
				components = require("catppuccin.groups.integrations.feline").get(),
			})
		end,
	},
}
