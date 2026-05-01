vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>',  {noremap = true, silent = true})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", opts)
vim.keymap.set('n', 'gb', vim.diagnostic.open_float)
