-- Space as the leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the arrow keys
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>", { noremap = true, silent = true })

-- Escape input mode with 'jj'
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- Easy creation of panes
vim.keymap.set({ "n", "v" }, "<leader>ws", ":vsplit<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>wv", ":split<CR>", { silent = true })

-- Easy navigation between panes
vim.keymap.set({ "n", "v" }, "<leader>h", ":wincmd h<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>j", ":wincmd j<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>k", ":wincmd k<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>l", ":wincmd l<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader><S-h>", ":wincmd <S-h><CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader><S-j>", ":wincmd <S-j><CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader><S-k>", ":wincmd <S-k><CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader><S-l>", ":wincmd <S-l><CR>", { silent = true })

-- Easy close file
vim.keymap.set({ "n", "v" }, "<leader>x", "<cmd>q<CR>", { silent = true })

-- Remap up-down movement
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { silent = true })
