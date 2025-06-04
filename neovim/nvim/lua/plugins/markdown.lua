return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	{
		"opdavies/toggle-checkbox.nvim",
		ft = "markdown",
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
				bullet = { icons = { '', '', '', '', '', '', '' } },
				checkbox = {
					unchecked = {
						icon = '󰄰 ',
						highlight = 'RenderMarkdownBullet'
					},
					checked = { icon = '󰄴 ' },
					custom = {
						todo = { rendered = ' ' },
						question = {
							raw = '[?]',
							rendered = ' ',
							highlight = '@string.regexp',
						},
						answer = {
							raw = '[!]',
							rendered = '󱩏 ',
							highlight = '@string',
						},
					},
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
