-- Space as the leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Easy creation of panes
vim.keymap.set({ "n", "v" }, "<leader>ws", ":vsplit<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>wv", ":split<CR>", { silent = true })

-- Disable the find highlight
vim.keymap.set({ "n", "v" }, "<leader><leader>", ":nohl<CR>", { silent = true })

-- Remap up-down movement
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { silent = true })


-- quickfix list delete keymap
function Remove_qf_item()
	local curqfidx = vim.fn.line(".")
	local qfall = vim.fn.getqflist()

	-- Return if there are no items to remove
	if #qfall == 0 then
		return
	end

	-- Remove the item from the quickfix list
	table.remove(qfall, curqfidx)
	vim.fn.setqflist(qfall, "r")

	-- Reopen quickfix window to refresh the list
	vim.cmd("copen")

	-- If not at the end of the list, stay at the same index, otherwise, go one up.
	local new_idx = curqfidx < #qfall and curqfidx or math.max(curqfidx - 1, 1)

	-- Set the cursor position directly in the quickfix window
	local winid = vim.fn.win_getid() -- Get the window ID of the quickfix window
	vim.api.nvim_win_set_cursor(winid, { new_idx, 0 })
end

vim.cmd("command! RemoveQFItem lua Remove_qf_item()")
vim.api.nvim_command("autocmd FileType qf nnoremap <buffer> dd :RemoveQFItem<cr>")

