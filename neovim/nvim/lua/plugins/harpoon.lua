return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set({ "n", "v" }, "<leader>a", function() harpoon:list():add() end)
		vim.keymap.set({ "n", "v" }, "<leader>w", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		vim.keymap.set({ "n", "v" }, "<leader>1", function() harpoon:list():select(1) end)
		vim.keymap.set({ "n", "v" }, "<leader>2", function() harpoon:list():select(2) end)
		vim.keymap.set({ "n", "v" }, "<leader>3", function() harpoon:list():select(3) end)
		vim.keymap.set({ "n", "v" }, "<leader>4", function() harpoon:list():select(4) end)
		vim.keymap.set({ "n", "v" }, "<leader>5", function() harpoon:list():select(5) end)
	end
}
