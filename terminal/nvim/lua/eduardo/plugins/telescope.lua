return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")


    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
            ["<C-o>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      }
    })


    -- Set keys
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files in cwd" })
    vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "Find recent string in cwd" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffer" })
    vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = "Find string under cursor" })
  end
}
