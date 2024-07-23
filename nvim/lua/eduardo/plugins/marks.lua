return {
	"chentoast/marks.nvim",
	config = function()
		require("marks").setup({
			-- Exemplo de configuração
			default_mappings = true,
			refresh_interval = 500, -- Atualiza as marcas a cada 500ms
		})

		vim.api.nvim_set_keymap("n", "<space>mm", "<cmd>BookmarksListAll<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<space>m1", "<cmd>BookmarksList 1<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<space>m2", "<cmd>BookmarksList 2<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<space>m3", "<cmd>BookmarksList 3<CR>", { noremap = true, silent = true })
	end,
}
