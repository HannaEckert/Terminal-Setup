return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup()

		-- Navigation
		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end)

		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end)

		vim.keymap.set("n", "<leader>gl", gitsigns.blame_line)
		vim.keymap.set("n", "<leader>gb", gitsigns.blame)
		vim.keymap.set("n", "<leader>gd", gitsigns.diffthis)
	end,
}
