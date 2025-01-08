return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{
			"tpope/vim-dadbod",
			lazy = true,
		},
		{
			"kristijanhusak/vim-dadbod-completion",
			ft = { "sqlserver" },
			lazy = true,
		},
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_show_database_icon = 1
		vim.g.db_ui_use_nvim_notify = 1

		-- Make the dbout window a resonable size
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "dbout",
			command = "resize 25",
		})

		-- Set a shortcut to open the DBUI
		vim.keymap.set({ "n", "v" }, "<leader>fd", function()
			-- Make the alpha dashboard disappear
			if vim.bo.filetype == "alpha" then
				vim.cmd("enew")
			end

			vim.cmd("DBUIToggle")
			vim.keymap.set({ "n", "v" }, "<leader>S", "<Plug>(DBUI_ExecuteQuery)")
			vim.keymap.set({ "v" }, "<leader>s", "<Plug>(DBUI_ExecuteQuery)")
			vim.keymap.set({ "n" }, "<leader>s", "vip<Plug>(DBUI_ExecuteQuery)<esc>")
		end, { silent = true })
	end,
}
