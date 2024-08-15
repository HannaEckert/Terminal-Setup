-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.smartindent = true

-- Search Settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

-- Undo History
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.o.undofile = true

-- Lines Around Cursor
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

-- Various Other
vim.o.wrap = false
vim.o.cursorline = false
vim.o.termguicolors = true
vim.o.updatetime = 50

-- Use the system clipboard if available
if vim.fn.has("clipboard") == 1 then
	vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
end

-- Set Syntax Highlight for BoxLang
local bx_syntax_group = vim.api.nvim_create_augroup("bx_syntax", { clear = true })
vim.api.nvim_create_autocmd(
	{ "BufNewFile", "BufRead" },
	{ pattern = { "*.bx", "*.bxs", "*.bxm", "*.cfs", "*.cfm" }, command = "set syntax=cf", group = bx_syntax_group }
)

-- Yank Highlighting
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})
