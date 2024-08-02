require('config.basic')
require('config.mappings')

-- Load Plugins (or Setup for VSCode)
if vim.g.vscode then
	require('config.vscode')
else
	require('config.lazy')
end

