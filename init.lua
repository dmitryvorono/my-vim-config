-- package manager
require("config.lazy")
require("config.lsp-zero")
require("config.mason")
require("config.autocompletion")
require("config.lua-ls")
require("config.format-before-save")
require("settings")
require("keymaps")
-----------------------------------------
---Color Schemes------------------------
---------------------------------------
vim.opt.termguicolors = true
vim.cmd.colorscheme("tokyonight")
