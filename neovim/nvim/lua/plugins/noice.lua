return {
	"folke/noice.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("noice").setup({
			cmdline = { view = "cmdline" },
			messages = { view = "mini" },
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
			routes = {
				{
					view = "popup",
					filter = { event = "msg_show", min_height = 5 },
				},
			},
		})
	end,
}
