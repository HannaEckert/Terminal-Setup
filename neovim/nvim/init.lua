-- Basic settings
vim.o.number = true -- Enable line numbers
vim.o.relativenumber = true -- Enable relative line numbers
vim.o.tabstop = 4 -- Number of spaces a tab represents
vim.o.shiftwidth = 4 -- Number of spaces for each indentation
vim.o.expandtab = false -- Convert tabs to spaces
vim.o.smartindent = true -- Automatically indent new lines
vim.o.wrap = false -- Disable line wrapping
vim.o.cursorline = false -- Highlight the current line
vim.o.termguicolors = true -- Enable 24-bit RGB colors
vim.o.ignorecase = true -- Ignore case when searching
vim.o.smartcase = true -- Except when searching with camelCase
vim.o.updatetime = 250 -- Decrease update time
vim.o.scrolloff = 10 -- Vertical scroll offset
vim.o.sidescrolloff = 10 -- Horizontal scroll offset

-- Syntax highlighting and filetype plugins
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- Space as the leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the arrow keys
vim.keymap.set({'n', 'i', 'v'}, '<Up>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({'n', 'i', 'v'}, '<Down>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({'n', 'i', 'v'}, '<Left>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({'n', 'i', 'v'}, '<Right>', '<Nop>', { noremap = true, silent = true })

-- Escape input mode with 'jj'
vim.keymap.set('i', 'jj', '<ESC>', { silent = true })

-- Easy creation of panes
vim.keymap.set({'n', 'v'}, '<leader>v', ':vsplit<CR>', { silent = true })
vim.keymap.set({'n', 's'}, '<leader>v', ':split<CR>', { silent = true })

-- Easy navigation between panes
vim.keymap.set({'n', 'v'}, '<leader>h', ':wincmd h<CR>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader>j', ':wincmd j<CR>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader>k', ':wincmd k<CR>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader>l', ':wincmd l<CR>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader><S-h>', ':wincmd <S-h><CR>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader><S-j>', ':wincmd <S-j><CR>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader><S-k>', ':wincmd <S-k><CR>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader><S-l>', ':wincmd <S-l><CR>', { silent = true })

-- Load plugins
require('config.lazy')
