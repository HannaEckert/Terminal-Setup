-- Fixing a folding-issue in vscode
local vscode = require('vscode-neovim')

local function mapMove(key, direction)
	vim.keymap.set('n', key, function()
		local count = vim.v.count
		local v = 1
		local style = 'wrappedLine'
		if count > 0 then
			v = count
			style = 'line'
		end
		vscode.action('cursorMove', {
			args = {
				to = direction,
				by = style,
				value = v
			}
		})
	end)
end

mapMove('k', 'up')
mapMove('j', 'down')
