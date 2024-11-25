return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- Function to get the current Git branch
		local function get_git_branch()
			local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
			local defaultKey = "no-git"

			if handle then
				local branch = handle:read("*a"):gsub("%s+", "")
				branch = string.gsub(branch, "/", "_")
				handle:close()

				if branch ~= "" then
					return branch
				end
			end

			return defaultKey
		end

		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set({ "n", "v" }, "<leader>a", function() harpoon:list(get_git_branch()):add() end)
		vim.keymap.set({ "n", "v" }, "<leader>fa", function() harpoon.ui:toggle_quick_menu(harpoon:list(get_git_branch())) end)

		vim.keymap.set({ "n", "v" }, "<leader>1", function() harpoon:list(get_git_branch()):select(1) end)
		vim.keymap.set({ "n", "v" }, "<leader>2", function() harpoon:list(get_git_branch()):select(2) end)
		vim.keymap.set({ "n", "v" }, "<leader>3", function() harpoon:list(get_git_branch()):select(3) end)
		vim.keymap.set({ "n", "v" }, "<leader>4", function() harpoon:list(get_git_branch()):select(4) end)
		vim.keymap.set({ "n", "v" }, "<leader>5", function() harpoon:list(get_git_branch()):select(5) end)
		vim.keymap.set({ "n", "v" }, "<leader>6", function() harpoon:list(get_git_branch()):select(6) end)

		vim.keymap.set({ "n", "v" }, "<leader>p", function() harpoon:list(get_git_branch()):prev() end)
		vim.keymap.set({ "n", "v" }, "<leader>n", function() harpoon:list(get_git_branch()):next() end)
	end
}
