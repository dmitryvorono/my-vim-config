-- package manager
require("config.lazy")
require("config.lsp-zero")
require("config.mason")
require("config.autocompletion")
require("config.lua-ls")
require("keymaps")
-----------------------------------------
---Color Schemes------------------------
---------------------------------------
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')
