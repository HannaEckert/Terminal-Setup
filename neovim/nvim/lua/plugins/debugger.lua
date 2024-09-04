return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("nvim-dap-virtual-text").setup({})
		dapui.setup()

		dap.set_log_level("TRACE")

		vim.keymap.set("n", "<left>", function()
			require("dap").continue()
		end)
		vim.keymap.set("n", "<right>", function()
			require("dap").step_over()
		end)
		vim.keymap.set("n", "<down>", function()
			require("dap").step_into()
		end)
		vim.keymap.set("n", "<up>", function()
			require("dap").step_out()
		end)
		vim.keymap.set("n", "<Leader>b", function()
			require("dap").toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>B", function()
			require("dap").set_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>dr", function()
			require("dap").repl.open()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end)

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		dap.adapters.cfml = {
			type = "executable",
			command = "node",
			args = { vim.fn.stdpath("config") .. "/cfmlsp/debug.js" },
		}

		dap.configurations.cfml = {
			{
				type = "cfml",
				request = "launch",
				name = "Connect to server",
				cwd = "${workspaceFolder}",
			},
		}
	end,
}
