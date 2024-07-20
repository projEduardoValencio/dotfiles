return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "buffers",
			separator_style = "slant",
			diagnostics = "nvim_lsp",
			-- diagnostics_update_in_insert = true,
			vim.diagnostic.config({ update_in_insert = true }),
		},
	},
}
