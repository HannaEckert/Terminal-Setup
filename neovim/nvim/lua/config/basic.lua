-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

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
vim.o.scrolloff = 6
vim.o.sidescrolloff = 6

-- Various Other
vim.o.wrap = false
vim.o.cursorline = false
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.o.laststatus = 3
vim.o.fileformats = "unix,dos,mac"
vim.o.fileformat = "unix"
vim.o.fixendofline = false

-- Code Folding
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 100
vim.opt.fillchars:append({fold = " "})
function _G.MyFoldText()
	local lineCount = vim.v.foldend - vim.v.foldstart + 1
	return "󰐕 " .. lineCount
end
vim.opt.foldtext = "v:lua.MyFoldText()"

-- Configure the wsl system clipboard
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = 'WslClipboard',
		copy = {
			['+'] = '/mnt/c/Windows/System32/clip.exe',
			['*'] = '/mnt/c/Windows/System32/clip.exe',
		},
		paste = {
			['+'] = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			['*'] = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}

	vim.keymap.set("n", "gx", function()
	  local url = vim.fn.expand("<cfile>")
	  vim.system({ "/mnt/c/Program Files/Mozilla Firefox/firefox.exe", url }, { detach = true })
	end, { silent = true })
end

-- Yank Highlighting
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})
