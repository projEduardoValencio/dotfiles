return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"vue",
				"javascript",
				"html",
				"css",
				"lua",
				"java",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
