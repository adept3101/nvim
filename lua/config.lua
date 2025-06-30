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
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
            config = function()
            vim.cmd.colorscheme("catppuccin-mocha")
            end,
        },

        -- Статусная строка
        { "vim-airline/vim-airline" },

        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
                -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
            },
            lazy = false, -- neo-tree will lazily load itself
            ---@module "neo-tree"
            ---@type neotree.Config?
            opts = {
                -- fill any relevant options here
            },
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
        {
            "akinsho/bufferline.nvim"
        },

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
        --{}
})
