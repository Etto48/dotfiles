vim.g.mapleader = " "

vim.keymap.set("n", "<leader><leader>", ':NvimTreeFocus<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<C-y>", "<C-r>", {})
vim.api.nvim_set_keymap("n", "<C-z>", "u", {})
vim.api.nvim_set_keymap("i", "<C-y>", "<C-O><C-r>", {})
vim.api.nvim_set_keymap("i", "<C-z>", "<C-O>u", {})
