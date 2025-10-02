return {
	"catppuccin/nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = 'frappe',
			transparent_background = true,
			float = {
				transparent = true,
				solid = false,
			},
			integrations = {
				cmp = true,
				gtisigns = true,
				harpoon = true,
				headlines = true,
				noice = true,
				notify = true,
				nvim_surround = true,
				dadbod_ui = true,
			},
		})

		vim.cmd.colorscheme("catppuccin-frappe")

		require("nvim-web-devicons").setup({
			override_by_extension = {
				["cfc"] = {
					icon = "",
					color = "#8caaee",
					name = "ColdFusionComponent",
				},
				["cfm"] = {
					icon = "",
					color = "#ea999c",
					name = "ColdFusionMarkup",
				},
				["cfs"] = {
					icon = "",
					color = "#a6d189",
					name = "ColdFusionScript",
				},

				["bx"] = {
					icon = "󰃔",
					color = "#8caaee",
					name = "BoxLangComponent",
				},
				["bxm"] = {
					icon = "󰃔",
					color = "#ea999c",
					name = "BoxLangMarkup",
				},
				["bxs"] = {
					icon = "󰃔",
					color = "#a6d189",
					name = "BoxLangScript",
				},
			},
		})
	end,
}
