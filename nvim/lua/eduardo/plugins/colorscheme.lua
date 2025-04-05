local Theme = {
	gruvbox ={
		name = "ellisonleao/gruvbox.nvim",
		set = "gruvbox"
	},
	github = {
		name = "projekt0n/github-nvim-theme",
		set = "github_dark_high_contrast"
	}
}

return {
	-- "projekt0n/github-nvim-theme",
	-- "ellisonleao/gruvbox.nvim",
	Theme.gruvbox.name,
	priority = 100,
	config = function()
		-- vim.cmd([[colorscheme github_dark_high_contrast]])
		-- vim.cmd([[colorscheme gruvbox]])
		vim.cmd("colorscheme " .. Theme.gruvbox.set)
		vim.cmd("hi Normal guibg=#xxxxxx")
	end,
}
