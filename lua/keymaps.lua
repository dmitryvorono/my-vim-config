-- nvim-tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>ef", vim.cmd.NvimTreeFindFile)
-- go to left right top bottom
vim.keymap.set("n", "<leader>w", "<c-w>")
-- divide vertical and horizontal
vim.keymap.set("n", "<leader>-", "<cmd>rightbelow split <cr>")
vim.keymap.set("n", "<leader>\\", "<cmd>rightbelow vsplit <cr>")
-- Telescope
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })

--Spectre
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})

-- jump and open float
function JumpPrevAndOpenFloatDiagnostic()
	vim.diagnostic.goto_prev()
	vim.diagnostic.open_float(nil, { focus = false })
end

function JumpNextAndOpenFloatDiagnostic()
	vim.diagnostic.goto_next()
	vim.diagnostic.open_float(nil, { focus = false })
end

vim.keymap.set("n", "[d", JumpPrevAndOpenFloatDiagnostic, { desc = "Jump to prev diagnostic" })
vim.keymap.set("n", "]d", JumpNextAndOpenFloatDiagnostic, { desc = "Jump to prev diagnostic" })
