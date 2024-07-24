return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }

		-- Definir um grupo de destaque personalizado
		-- vim.cmd([[
		--     highlight CustomHover guibg=#282C34
		--   ]])
		local custom_hover = function()
			local params = vim.lsp.util.make_position_params()
			vim.lsp.buf_request(0, "textDocument/hover", params, function(err, result, ctx, config)
				if err ~= nil or result == nil then
					return
				end
				local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
				markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
				if vim.tbl_isempty(markdown_lines) then
					return
				end
				local bufnr, winnr =
					vim.lsp.util.open_floating_preview(markdown_lines, "markdown", { border = "rounded" })
				vim.api.nvim_win_set_option(winnr, "winhighlight", "Normal:CustomHover")
			end)
		end

		-- Mapear a função de hover personalizada
		vim.api.nvim_set_keymap("n", "K", "<cmd>lua custom_hover()<CR>", { noremap = true, silent = true })

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			if client.name == "vuels" then
				client.server_capabilities.documentFormattingProvider = false
			end

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Code Action"
			keymap.set("n", "ga", vim.lsp.buf.code_action, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", vim.lsp.buf.type_definition, opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", custom_hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["vuels"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = require("lspconfig/util").root_pattern("package.json", "vue.config.js"),
			settings = {
				vetur = {
					completion = {
						autoImport = true,
						useScaffoldSnippets = true,
						tagCasing = "kebab", -- Garantir que os nomes dos componentes sejam sugeridos em kebab-case
						attrCasing = "kebab", -- Garantir que os atributos dos componentes sejam sugeridos em kebab-case
					},
					grammar = {
						customBlocks = {
							docs = "markdown",
							i18n = "json",
						},
					},
					validation = {
						template = true,
						script = true,
						style = true,
						templateProps = true,
						interpolation = true,
					},
					format = {
						enable = true,
						options = {
							tabSize = 2,
							useTabs = false,
						},
					},
					languageFeatures = {
						codeActions = true,
						codeLens = true,
						completion = {
							defaultAttrNameCase = "kebab",
							defaultTagNameCase = "kebab",
						},
						definition = true,
						diagnostic = true,
						documentHighlight = true,
						documentLink = true,
						documentSymbol = true,
						hover = true,
						references = true,
						rename = true,
						signatureHelp = true,
						semanticTokens = true,
					},
				},
			},
		})

		lspconfig["jdtls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["csharp_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				csharp = {
					organizeImports = true,
				},
			},
		})

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
