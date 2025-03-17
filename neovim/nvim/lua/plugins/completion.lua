return {
	{
		"L3MON4D3/LuaSnip",
		ft = vim.g.coding_file_types,
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		ft = vim.g.coding_file_types,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "petertriho/cmp-git" },
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
					},
				},
			},
			{ "Bilal2453/luvit-meta", lazy = true },
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").load_standalone({
				path = "~/.local/share/snippets.code-snippets",
			})

			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "vim-dadbod-completion" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "lazydev" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" },
				}, {
					{ name = "buffer" },
				}),
			})
			require("cmp_git").setup()

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = {
					disallow_symbol_nonprefix_matching = false,
					disallow_fuzzy_matching = false,
					disallow_partial_matching = false,
					disallow_fullfuzzy_matching = false,
					disallow_prefix_unmatching = false,
					disallow_partial_fuzzy_matching = false
				},
			})

			-- Shortcuts for navigating within snippets
			local ls = require("luasnip")

			-- Jump cursor forward
			vim.keymap.set({ "i", "s" }, "<leader>cl", function()
				ls.jump(1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<leader>cj", function()
				ls.jump(1)
			end, { silent = true })

			-- Jump cursor back
			vim.keymap.set({ "i", "s" }, "<leader>ch", function()
				ls.jump(-1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<leader>ck", function()
				ls.jump(-1)
			end, { silent = true })
		end,
	},
}
