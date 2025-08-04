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

    -- Основные настройки
    vim.opt.mouse = "a"          -- Включить мышь во всех режимах
    vim.opt.number = true        -- Показать номера строк
    vim.opt.tabstop = 4          -- 1 таб = 4 пробела
    vim.opt.shiftwidth = 4       -- Для consistency с tabstop
    vim.opt.expandtab = true     -- Преобразовывать табы в пробелы
    vim.opt.autoindent = true    -- Автоотступы
    vim.opt.relativenumber = true
    -- Глобальный лидер
    vim.g.mapleader = " "


    -- Настройка плагинов через Lazy.nvim
    require("lazy").setup({
        -- Цветовая схема
        --{
          --  "catppuccin/nvim",
           -- name = "catppuccin",
           -- priority = 1000,
            --config = function()
            --vim.cmd.colorscheme("catppuccin-mocha")
            --end,
        --},
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
	config = function()
        vim.cmd.colorscheme("tokyonight-moon")
        end,
    },
        
        -- Статусная строка
        -- { "vim-airline/vim-airline" },

        -- {"vim-airline/vim-airline-themes"},

    -- {
    --     'nvim-lualine/lualine.nvim',
    --     dependencies = { 'nvim-tree/nvim-web-devicons' }
    -- },

        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
           -- modifiable = true,
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
                            },
            lazy = false,
            opts = {
                window = {
                    mappings = {
                        ["h"] = "close_node",       -- Закрыть папку или подняться на уровень выше
                        ["l"] = "open",             -- Открыть файл/папку
                        ["v"] = "open_vsplit",      -- Вертикальный сплит (опционально)
                        ["s"] = "open_split",       -- Горизонтальный сплит (опционально)
                    },
                },
            }
        },
        
        { "ryanoasis/vim-devicons" },
        { "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"  },
        { "neovim/nvim-lspconfig" },
        {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'}, {'lewis6991/gitsigns.nvim'},
        --{ " williamboman/mason.nvim ", build = ":MasonUpdate"},
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

        {
            "windwp/nvim-autopairs"
        },
        -- {
        --     "akinsho/bufferline.nvim"
        -- },

        {
            "akinsho/toggleterm.nvim", version = "*", config = true
        },

        {
            "windwp/nvim-ts-autotag"
        },

        {'terrortylor/nvim-comment'},

        {
            'glepnir/dashboard-nvim',
            event = 'VimEnter',
            dependencies = {{'nvim-tree/nvim-web-devicons'}}
        },

        {'lewis6991/gitsigns.nvim'},

        {
            "hrsh7th/vim-vsnip",
            event = "InsertEnter"
        },

        {
            "hrsh7th/cmp-vsnip",
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
            branch = "regexp",   
            keys = {
                { "<leader>vs", "<cmd>VenvSelect<cr>" },
            },
            opts = {},
        },

        {"nvim-lua/plenary.nvim"},

     {
  "rebelot/heirline.nvim",
  dependencies = {
    "Zeioth/heirline-components.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local heirline_components = require("heirline-components.all")

    require("heirline").setup({
      statusline = {
          condition = function()
              return vim.bo.filetype ~= "neo-tree"
          end,
        heirline_components.component.mode(),
        heirline_components.component.file_info(),
        heirline_components.component.git_branch(),
        heirline_components.component.diagnostics(),
        heirline_components.component.fill(),
        heirline_components.component.lsp(),
        heirline_components.component.nav(),
      },
      opts = {
        colors = heirline_components.hl.get_colors(),
      },
    })
  end,
},




{"numToStr/Comment.nvim"},


})
