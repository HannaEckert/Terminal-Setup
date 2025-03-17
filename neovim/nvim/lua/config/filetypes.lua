-- Add cfml and boxlang filetypes
vim.filetype.add({
	extension = {
		cfm = "cfml",
		cfc = "cfscript",
		cfs = "cfscript",
		bxm = "boxlang",
		bx = "boxlang",
		bxs = "boxlang",
		["code-snippets"] = "json",
	},
})

vim.g.coding_file_types = {
	"javascript", "css", "html", "xml", "cfml",
	"cfscript", "boxlang", "json", "markdown", "sql",
	"lua", "zsh", "sh", "cpp", "c", "dockerfile",
	"gitcommit", "java"
}
