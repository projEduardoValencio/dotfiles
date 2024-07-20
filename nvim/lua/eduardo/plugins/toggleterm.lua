return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {--[[ things you want to change go here]]
			vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Open ToggleTerm" }),
		},
	},
}
