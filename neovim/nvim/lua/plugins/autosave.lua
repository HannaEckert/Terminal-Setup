return {
	"okuuva/auto-save.nvim",
	event = { "InsertLeave", "TextChanged" },
	opts = {
		condition = function(buf)
			local fn = vim.fn
			local utils = require("auto-save.utils.data")

			if
				fn.getbufvar(buf, "&modifiable") == 1
				-- change here is adding harpoon file type to exclusion list
				and utils.not_in(fn.getbufvar(buf, "&filetype"), { "harpoon" })
			then
				return true
			end
			return false
		end,
	},
}
