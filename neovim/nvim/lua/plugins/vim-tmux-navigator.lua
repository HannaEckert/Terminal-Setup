return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight"
	},
	keys = {
		{ "<leader>h", "<cmd>TmuxNavigateLeft<cr>" },
		{ "<leader>j", "<cmd>TmuxNavigateDown<cr>" },
		{ "<leader>k", "<cmd>TmuxNavigateUp<cr>" },
		{ "<leader>l", "<cmd>TmuxNavigateRight<cr>" }
	}
}

