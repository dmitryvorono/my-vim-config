-- general
-- vim.keymap.set('n', '<c-l>', '<cmd>bnext<CR>', { desc = 'Next buffer'});
-- vim.keymap.set('n', '<c-h>', '<cmd>bprev<CR>', { desc = 'Prev buffer'});
vim.keymap.set('n', '<leader>w', '<c-w>');
-- nvim-tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>ef", vim.cmd.NvimTreeFindFile)
-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim)
vim.keymap.set('n', '<Tab>', vim.cmd.BufferLineCycleNext)
vim.keymap.set('n', '<S-Tab>', vim.cmd.BufferLineCyclePrev)
