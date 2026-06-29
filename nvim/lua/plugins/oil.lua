return {
  "stevearc/oil.nvim",
  lazy = false,
  cmd = { "Oil" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
    },
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)
  end,
}
