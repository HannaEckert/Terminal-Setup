return {
	"LunarVim/bigfile.nvim",
	config = function()
		require("bigfile").setup({
			filesize = 2,
			pattern = function(bufnr)
				local filepath = vim.api.nvim_buf_get_name(bufnr)

				-- Minified javascript files are a performance killer
				if filepath:find(".min.js$") or filepath:find(".min.css$")  then
					return true
				end

				return false
			end,
			features = {
				"indent_blankline",
				"lsp",
				"treesitter",
				"syntax",
				"matchparen",
				"vimopts",
				"filetype",
			},
		})
	end,
}
