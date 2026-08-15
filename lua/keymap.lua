vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>',  {noremap = true, silent = true})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", opts)
vim.keymap.set('n', 'gb', vim.diagnostic.open_float)
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua oldfiles<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>")
