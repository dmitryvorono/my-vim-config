-- nvim-tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>ef", vim.cmd.NvimTreeFindFile)
-- go to left right top bottom
vim.keymap.set('n', '<leader>w', '<c-w>');
-- divide vertical and horizontal
vim.keymap.set("n", "<leader>-", "<cmd>rightbelow split <cr>")
vim.keymap.set("n", "<leader>\\", "<cmd>rightbelow vsplit <cr>")
-- Telescope
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })

