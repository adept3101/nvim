local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
    end
    vim.opt.rtp:prepend(lazypath)

    vim.g.mapleader = " "
    vim.opt.mouse = "a"
    vim.opt.number = true
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.opt.autoindent = true
    vim.opt.relativenumber = true
    vim.opt.cmdheight = 0 -- для отключения cmd
    -- vim.opt.laststatus=0


  vim.opt.clipboard = "unnamedplus"
  vim.diagnostic.config({
    virtual_text = {
        prefix = '●',
        spacing = 2,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.keymap.set('n', 'gb', vim.diagnostic.open_float)

require("lazy").setup({

  {
           "catppuccin/nvim",
           name = "catppuccin",
           commit = "fa42eb5",
           priority = 1000,
            config = function()
            vim.cmd.colorscheme("catppuccin-mocha")
            end,
        },

        
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },

    lazy = false,
    opts = {
      window = {
        position = "right",
        mappings = {
          ["h"] = "close_node",       -- Закрыть папку или подняться на уровень выше
          ["l"] = "open",             -- Открыть файл/папку
          ["v"] = "open_vsplit",      -- Вертикальный сплит (опционально)
          ["s"] = "open_split",       -- Горизонтальный сплит (опционально)
          
        },
      },
      filesystem = {
        window = {
          mappings = {},
        },
        
        hijack_netrw_behavior = "open_default",
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
    },
    
    event_handlers = {},
    default_component_configs = {},
    open_files_do_not_replace_types = { "terminal", "Trouble", "qf" },
    open_in_place = false,
  }
},

{ "ryanoasis/vim-devicons" },
{ "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"  },
{ "neovim/nvim-lspconfig" },
{'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/cmp-buffer'},
{'hrsh7th/cmp-path'},
{'hrsh7th/cmp-cmdline'},
{'hrsh7th/nvim-cmp'},
{'lewis6991/gitsigns.nvim'},

{
  "williamboman/mason.nvim",
  config = function()
  require("mason").setup()
  end,
},

{
  "nvim-telescope/telescope.nvim",
  tag = '0.1.5',
  dependencies = {'nvim-lua/plenary.nvim'}
},

{"windwp/nvim-autopairs"},
{"akinsho/toggleterm.nvim", version = "*", config = true},
{"windwp/nvim-ts-autotag"},
-- {'terrortylor/nvim-comment'},
{'lewis6991/gitsigns.nvim'},
       
-- {
--   "hrsh7th/vim-vsnip",
--   event = "InsertEnter"  
-- },

{
  "hrsh7th/cmp-vsnip",
  event = "InsertEnter",
  dependencies = { "hrsh7th/vim-vsnip" },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" },
      },
    })
  end,  
},

        
{
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },

  lazy = false,
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
  },
  opts = {},
},

{"nvim-lua/plenary.nvim"},

{"numToStr/Comment.nvim"},

{"nvim-tree/nvim-web-devicons"},

{
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }
},

-- {
--   "rebelot/heirline.nvim",
--   dependencies = {
--     "Zeioth/heirline-components.nvim",
--     "nvim-tree/nvim-web-devicons",
--   },
--   config = function()
--     local heirline_components = require("heirline-components.all")
--
--     require("heirline").setup({
--       statusline = {
--           condition = function()
--               return vim.bo.filetype ~= "neo-tree"
--           end,
--         heirline_components.component.mode(),
--         heirline_components.component.file_info(),
--         heirline_components.component.git_branch(),
--         heirline_components.component.diagnostics(),
--         heirline_components.component.fill(),
--         heirline_components.component.lsp(),
--         heirline_components.component.nav(),
--       },
--       opts = {
--         colors = heirline_components.hl.get_colors(),
--       },
--     })
--   end,
-- },

{"akinsho/bufferline.nvim", version="*",
dependencies = { 'nvim-tree/nvim-web-devicons' }
},

-- {
--     's1n7ax/nvim-window-picker',
--     name = 'window-picker',
--     event = 'VeryLazy',
--     version = '2.*',
--     config = function()
--         require'window-picker'.setup()
--     end,
-- },
{
"OXY2DEV/markview.nvim",
  lazy = false,
},
{
            'glepnir/dashboard-nvim',
            event = 'VimEnter',
            dependencies = {{'nvim-tree/nvim-web-devicons'}}
        },
})
