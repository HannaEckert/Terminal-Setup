-- Fixing a folding-issue in vscode
local vscode = require("vscode")

vim.keymap.set("n", "gd", function()
	vscode.action("workbench.action.showAllSymbols")
end)
