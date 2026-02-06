vim.cmd("language messages en_US.UTF-8")
vim.deprecate = function() end

require("config")
require("keymap")
require("plugins.treesitter")
require("plugins.cmp")
require("plugins.telescope")
require("plugins.autopairs")
require("plugins.toggleterm")
require("plugins.line")
require("plugins.lsp")
require("plugins.buffline")
require("plugins.dashboard")
