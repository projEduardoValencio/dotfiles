return {
	{
		"mfussenegger/nvim-jdtls",
		cond = function()
			return not vim.o.diff
		end,
		ft = "java",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function()
					local jdtls = require("jdtls")
					local wk = require("which-key")
					local bufnr = vim.api.nvim_get_current_buf()

          -- stylua: ignore start
          local extract_variable = function() jdtls.extract_variable(true) end
          local extract_method = function() jdtls.extract_method(true) end
					-- stylua: ignore end

					wk.register({
						["<leader>cJ"] = { name = "+java", buffer = bufnr, mode = { "n", "v" } },
					})

					wk.register({
						i = { jdtls.organize_importsorganize_imports, "Organize imports" },
						t = { jdtls.test_class, "Test class" },
						n = { jdtls.test_nearest_method, "Test nearest method" },
						e = { extract_variable, "Extract variable" },
						M = { extract_method, "Extract method" },
					}, {
						prefix = "<leader>cJ",
						buffer = bufnr,
					})

					wk.register({
						e = { extract_variable, "Extract variable" },
						M = { extract_method, "Extract method" },
					}, {
						mode = "v",
						prefix = "<leader>cJ",
						buffer = bufnr,
					})

					jdtls.start_or_attach({
						cmd = { "jdtls" },
						settings = {
							java = {},
						},
						root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "build.gradle" }),
					})
				end,
			})

			return true
		end,
	},
	-- { "mfussenegger/nvim-dap" },
	-- {
	-- 	"rcarriga/nvim-dap-ui",
	-- 	required = "mfussenegger/nvim-dap",
	-- 	config = function()
	-- 		require("neodev").setup({
	-- 			library = { plugins = { "nvim-dap-ui" }, types = true },
	-- 		})
	-- 		local dap, dapui = require("dap"), require("dapui")
	-- 		dap.listeners.before.attach.dapui_config = function()
	-- 			dapui.open()
	-- 		end
	-- 		dap.listeners.before.launch.dapui_config = function()
	-- 			dapui.open()
	-- 		end
	-- 		dap.listeners.before.event_terminated.dapui_config = function()
	-- 			dapui.close()
	-- 		end
	-- 		dap.listeners.before.event_exited.dapui_config = function()
	-- 			dapui.close()
	-- 		end
	--
	-- 		-- Eval with ui.input
	-- 		local request_eval_dap_ui = function()
	-- 			vim.ui.input("Eval: ", function(input)
	-- 				dapui.eval(input)
	-- 			end)
	-- 		end
	--
	-- 		-- DEBUG Keys
	-- 		vim.keymap.set("n", "<leader>de", request_eval_dap_ui, { desc = "Eval in debug" })
	-- 		vim.keymap.set("n", "<leader>dt", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
	-- 		vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Continue Debug" })
	-- 		vim.keymap.set("n", "<leader>di", '<cmd>lua require("dapui").toggle()<CR>', { desc = "Toggle Dap UI" })
	--
	-- 		dap.setup()
	-- 		dapui.setup()
	-- 	end,
	-- },
	-- {
	-- 	"nvim-java/nvim-java",
	-- 	dependencies = {
	-- 		"nvim-java/lua-async-await",
	-- 		"nvim-java/nvim-java-core",
	-- 		"nvim-java/nvim-java-test",
	-- 		"nvim-java/nvim-java-dap",
	-- 		"MunifTanjim/nui.nvim",
	-- 		"neovim/nvim-lspconfig",
	-- 		"mfussenegger/nvim-dap",
	-- 		{
	-- 			"williamboman/mason.nvim",
	-- 			opts = {
	-- 				registries = {
	-- 					"github:nvim-java/mason-registry",
	-- 					"github:mason-org/mason-registry",
	-- 				},
	-- 			},
	-- 		},
	-- 		{
	-- 			"williamboman/mason-lspconfig.nvim",
	-- 			opts = {
	-- 				handlers = {
	-- 					["jdtls"] = function()
	-- 						require("java").setup()
	-- 					end,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
}
