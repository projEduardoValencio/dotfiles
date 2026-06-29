vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

keymap.set("n", "<leader>e", ":NERDTreeToggle<CR>", { silent = true, desc = "Toggle NERDTree" })
keymap.set("n", "<leader>nn", ":NERDTreeToggle<CR>", { silent = true, desc = "Toggle NERDTree" })
keymap.set("n", "<leader>no", ":NERDTreeFocus<CR>", { silent = true, desc = "Focus NERDTree" })
keymap.set("n", "<leader>nf", ":NERDTreeFind<CR>", { silent = true, desc = "Find file in NERDTree" })
keymap.set("n", "-", "<cmd>Oil<CR>", { silent = true, desc = "Open parent directory" })
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true, desc = "Find files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { silent = true, desc = "Live grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { silent = true, desc = "Buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { silent = true, desc = "Help tags" })
keymap.set("n", "<leader>mp", "<cmd>RenderMarkdown toggle<CR>", { silent = true, desc = "Markdown render" })
