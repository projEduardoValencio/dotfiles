return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic",
    delay = 300,
    spec = {
      { "<leader>f", group = "find" },
      { "<leader>m", group = "markdown" },
      { "<leader>n", group = "nerdtree" },
      { "<leader>o", group = "obsidian" },
      { "<leader>r", group = "rename" },
      { "<leader>c", group = "code" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
  end,
}
