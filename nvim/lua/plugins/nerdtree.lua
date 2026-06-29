return {
  "preservim/nerdtree",
  dependencies = {
    "Xuyuanp/nerdtree-git-plugin",
  },
  cmd = {
    "NERDTree",
    "NERDTreeToggle",
    "NERDTreeFocus",
    "NERDTreeFind",
  },
  keys = {
    { "<leader>e", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree" },
    { "<leader>nn", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree" },
    { "<leader>no", ":NERDTreeFocus<CR>", desc = "Focus NERDTree" },
    { "<leader>nf", ":NERDTreeFind<CR>", desc = "Find file in NERDTree" },
  },
  init = function()
    vim.g.NERDTreeShowHidden = 1
    vim.g.NERDTreeMinimalUI = 1
    vim.g.NERDTreeWinSize = 32
  end,
}
