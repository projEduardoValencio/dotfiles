return {
	{ "mfussenegger/nvim-dap" },
	{
		"rcarriga/nvim-dap-ui",
		required = "mfussenegger/nvim-dap",
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})

			local dap, dapui = require("dap"), require("dapui")
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

			-- Eval with ui.input
			local request_eval_dap_ui = function()
				vim.ui.input("Eval: ", function(input)
					dapui.eval(input)
				end)
			end

			-- DEBUG Keys
			vim.keymap.set("n", "<leader>de", request_eval_dap_ui, { desc = "Eval in debug" })
			vim.keymap.set("n", "<leader>dt", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Continue Debug" })
			vim.keymap.set("n", "<leader>di", '<cmd>lua require("dapui").toggle()<CR>', { desc = "Toggle Dap UI" })

			dap.setup()
			dapui.setup()
		end,
	},
}
