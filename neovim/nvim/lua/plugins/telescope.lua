return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set({ "n", "v" }, "<leader>ff", builtin.find_files, {})
			vim.keymap.set({ "n", "v" }, "<leader>fF", function()
				builtin.find_files({ hidden = true, no_ignore = true })
			end)
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("v", "<leader>fg", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>")

			vim.keymap.set({ "n", "v" }, "<leader>fb", builtin.buffers)
			vim.keymap.set({ "n", "v" }, "<leader>fh", builtin.help_tags)
			vim.keymap.set({ "n", "v" }, "<leader>fc", builtin.git_status)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				defaults = {
					mappings = {
						i = {
							["<C-a>"] = actions.select_vertical,
						},
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
}
