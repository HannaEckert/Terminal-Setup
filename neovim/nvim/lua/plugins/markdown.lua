return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	{
		"opdavies/toggle-checkbox.nvim",
		config = function()
			require("render-markdown").setup({
				heading = {
					icons = { " ", " ", " ", " ", "󱁇 " ,"󱁄 "},
					position = "inline",
					width = "block",
					min_width = 80,
					left_pad = 2,
				},
			})

			vim.keymap.set("n", "<leader>t", ":lua require('toggle-checkbox').toggle()<CR>", { silent = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
				pattern = { "*.md" },
				callback = function()
					vim.o.signcolumn = "yes"
				end,
			})
		end,
	},
}
