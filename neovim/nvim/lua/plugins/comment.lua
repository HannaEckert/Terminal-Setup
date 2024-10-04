return {
	"numToStr/Comment.nvim",
	config = function()
		-- Setup the correct comment string
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			pattern = { "*.cfc", "*.cfs", "*.bx", "*.bxs" },
			callback = function()
				vim.opt.commentstring = "// %s"
			end,
		})

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			pattern = { "*.cfm", "*.bxm" },
			callback = function()
				vim.opt.commentstring = "<!--- %s --->"
			end,
		})

		require("Comment").setup()
	end,
}
