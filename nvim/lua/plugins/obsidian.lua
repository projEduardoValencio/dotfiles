return {
  "epwalsh/obsidian.nvim",
  version = "*",
  cond = function()
    return vim.fn.isdirectory(vim.fn.expand("~/Documents/ObsidianVault")) == 1
  end,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Obsidian search" },
    { "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Obsidian quick switch" },
    { "<leader>ot", "<cmd>ObsidianToday<CR>", desc = "Obsidian today" },
  },
  opts = function()
    local vault_path = vim.fn.expand("~/Documents/ObsidianVault")

    return {
      workspaces = {
        {
          name = "personal",
          path = vault_path,
        },
      },
      completion = {
        nvim_cmp = false,
        min_chars = 2,
      },
      picker = {
        name = "telescope.nvim",
      },
      notes_subdir = "notes",
      new_notes_location = "notes_subdir",
      preferred_link_style = "wiki",
    }
  end,
}
