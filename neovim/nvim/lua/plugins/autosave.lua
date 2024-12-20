return {
	"okuuva/auto-save.nvim",
	event = { "InsertLeave", "TextChanged" },
	opts = {
		condition = function()
			if
				vim.o.modifiable
				and vim.o.modified
				-- disable autosave for the harpoon quick edit window
				and vim.o.filetype ~= "harpoon"
				-- disable autosave when dadbod-ui is active
				and not (vim.g.loaded_dbui and vim.api.nvim_buf_get_name(0):find("^/tmp/nvim."))
			then
				return true
			end

			return false
		end,
	},
}
