return {
	"okuuva/auto-save.nvim",
	event = { "InsertLeave", "TextChanged" },
	opts = {
		condition = function()
			local filepath = vim.api.nvim_buf_get_name(0)

			if
				vim.o.modifiable
				and vim.o.modified
				-- disable autosave for the harpoon quick edit window
				and vim.o.filetype ~= "harpoon"
				-- disable autosave when dadbod-ui is active
				and not (vim.g.loaded_dbui and filepath:find("^/tmp/nvim."))
				-- disable autosave for minified javascript files
				and not (filepath:find(".min.js$") or filepath:find(".min.css$"))
			then
				return true
			end

			return false
		end,
	},
}
