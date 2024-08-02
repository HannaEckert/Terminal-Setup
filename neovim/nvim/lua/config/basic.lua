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
vim.o.hlsearch = false
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
