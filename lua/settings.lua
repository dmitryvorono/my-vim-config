-- копирование в систмный буффер
vim.api.nvim_set_option_value("clipboard", "unnamed", {})

-- Search
vim.o.incsearch = true -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insentive unless capitals used in searcher

-- видно номера строк
vim.opt.number = true
vim.opt.relativenumber = true

--вот это в терминале набираешь и видно ошибку в пупапе lua vim.diagnostic.open_float();
