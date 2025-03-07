return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	{
		"opdavies/toggle-checkbox.nvim",
		config = function()
			require("render-markdown").setup({
				latex = { enabled = false },
				heading = {
					border = true,
					border_virtual = false,
					border_prefix = true,
					sign = false,
					position = "inline",
					above =   "╭─────────── ─ ─ - -                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ",
					icons = { "╰─   " },
					below =   "",
					backgrounds = {},
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
