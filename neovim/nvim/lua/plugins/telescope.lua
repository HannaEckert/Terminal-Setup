return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set({ "n", "v" }, "<leader>ff", builtin.find_files, {})
			vim.keymap.set({ "n", "v" }, "<leader>fF", function()
				builtin.find_files({ hidden = true, no_ignore = true })
			end)
			vim.keymap.set("n", "<leader>fg", ":Telescope live_grep_args<CR>")
			vim.keymap.set("v", "<leader>fg", "y<ESC>:Telescope live_grep_args default_text=<c-r>0<CR>")

			vim.keymap.set({ "n", "v" }, "<leader>fb", builtin.buffers)
			vim.keymap.set({ "n", "v" }, "<leader>fh", builtin.help_tags)
			vim.keymap.set({ "n", "v" }, "<leader>fl", builtin.resume)
			vim.keymap.set({ "n", "v" }, "<leader>fm", builtin.keymaps)
			vim.keymap.set({ "n", "v" }, "<leader>fc", builtin.git_status)
			vim.keymap.set({ "n", "v" }, "<leader>fp", builtin.registers)
			vim.keymap.set({ "n", "v" }, "<leader>fs", builtin.symbols)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
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
					preview = {
						filesize_limit = 2,
						timeout = 100,
						filetype_hook = function(filepath)
							if filepath:find(".min.js$") or filepath:find(".min.css$") then
								return false
							end

							return true
						end,
					},
				},
			})

			telescope.load_extension("live_grep_args")
			telescope.load_extension("ui-select")
		end,
	},
}
