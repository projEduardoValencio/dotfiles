vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.require('config.markdown').foldexpr(v:lnum)"
vim.opt_local.foldlevel = 99
vim.opt_local.foldlevelstart = 99
vim.opt_local.foldenable = true
