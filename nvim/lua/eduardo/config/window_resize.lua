local WR = {}

-- Funções para ajustar o tamanho da janela
function WR.adjust_width(amount)
	local win = vim.api.nvim_get_current_win()
	local width = vim.api.nvim_win_get_width(win)
	vim.api.nvim_win_set_width(win, width + amount)
end

function WR.adjust_height(amount)
	local win = vim.api.nvim_get_current_win()
	local height = vim.api.nvim_win_get_height(win)
	vim.api.nvim_win_set_height(win, height + amount)
end

-- Mapeamentos para ajustar o tamanho da janela
function WR.setup()
	vim.api.nvim_set_keymap(
		"n",
		">",
		':lua require("eduardo.config.window_resize").adjust_width(2)<CR>',
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<",
		':lua require("eduardo.config.window_resize").adjust_width(-2)<CR>',
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"+",
		':lua require("eduardo.config.window_resize").adjust_height(2)<CR>',
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"-",
		':lua require("eduardo.config.window_resize").adjust_height(-2)<CR>',
		{ noremap = true, silent = true }
	)
end

return WR
