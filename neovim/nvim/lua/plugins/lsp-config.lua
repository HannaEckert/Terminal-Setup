return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"html",
					"bashls",
					"cssls",
					"jsonls",
					"remark_ls",
					"jdtls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		events = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			local configs = require("lspconfig.configs")

			-- Add my custom lsps
			if not configs.cfmlsp then
				configs.cfmlsp = {
					default_config = {
						cmd = { vim.fn.stdpath("config") .. "/cfmlsp/lsp" },
						root_dir = lspconfig.util.root_pattern(".git", ".config"),
						filetypes = { "cfml" },
						on_new_config = function(new_config, new_root_dir)
							local configPath = vim.fn.stdpath("config") .. "/cfmlsp/profile.xml"
							local targetConfigPath = new_root_dir .. "/.cfmlsp"
							local profileFile = targetConfigPath .. "/profile.xml"

							new_config.init_options = {
								profile = {
									name = "profile",
									location = ".cfmlsp",
								},
								globalStoragePath = {
									uri = targetConfigPath,
								},
							}

							-- Copy default profile.xml if it doesn't exist yet
							local file = io.open(profileFile, "r")
							if file ~= nil then
								io.close(file)
							else
								vim.cmd("silent !mkdir -p " .. targetConfigPath)
								vim.cmd("silent !cp " .. configPath .. " " .. profileFile)
							end
						end,
					},
				}
			end

			if not configs.boxlsp then
				configs.boxlsp = {
					default_config = {
						cmd = { vim.fn.stdpath("config") .. "/boxlsp/lsp" },
						root_dir = lspconfig.util.root_pattern(".git", ".config"),
						filetypes = { "boxlang" },
					},
				}
			end

			lspconfig.boxlsp.setup({ capabilities = capabilities })
			lspconfig.cfmlsp.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.remark_ls.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>.", vim.lsp.buf.code_action, {})
		end,
	},
}
