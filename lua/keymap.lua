--vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>", { noremap = true, silent = true })
--vim.keymap.set("n", "<C-n>", ":NERDTree<CR>", { noremap = true, silent = true })
--vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
--vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>',  {noremap = true, silent = true})
