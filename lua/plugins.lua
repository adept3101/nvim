vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
})
vim.cmd.colorscheme "catppuccin-mocha"

vim.pack.add({
  {
    src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    version = vim.version.range('3'),
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
  window = {
    position = "right",
    mappings = {
      ["h"] = "close_node",  -- Закрыть папку или подняться на уровень выше
      ["l"] = "open",        -- Открыть файл/папку
      ["v"] = "open_vsplit", -- Вертикальный сплит (опционально)
      ["s"] = "open_split",  -- Горизонтальный сплит (опционально)

    },
  },
  filesystem = {
    hijack_netrw_behavior = "open_default",
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,

    window = {
      mappings = {},
    },
  },

  event_handlers = {},
  default_component_configs = {},
  open_files_do_not_replace_types = { "terminal", "Trouble", "qf" },
  open_in_place = false,
})

vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require('lualine').setup({

  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    extensions = { 'neo-tree', },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
      -- 'neo-tree',
    },
    ignore_focus = { 'neo-tree' }, -- игнор neo-tree при запуске
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true, -- глобальный
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', --[['fileformat',]] 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = { '' },
    lualine_b = { '' },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
})

vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
})
require("mason").setup()

vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1") },
  "https://github.com/rafamadriz/friendly-snippets",
})

require('blink.cmp').setup({
  keymap = {
    preset = 'default',
    ["<C-space>"] = {},
    ["<C-p>"] = {},
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = {},
    ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-n>"] = { "select_and_accept" },
    ["<C-k>"] = { "select_prev", "fallback" },
    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-b>"] = { "scroll_documentation_down", "fallback" },
    ["<C-f>"] = { "scroll_documentation_up", "fallback" },
    ["<C-l>"] = { "snippet_forward", "fallback" },
    ["<C-h>"] = { "snippet_backward", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
  },

  appearance = {
    nerd_font_variant = 'mono'
  },

  completion = { documentation = { auto_show = false } },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  -- opts_extend = { "sources.default" }
})

-- vim.pack.add({
--   {
--     src = "https://github.com/nvim-treesitter/nvim-treesitter",
--     config = function()
--       require('nvim-treesitter.configs').setup({
--         ensure_installed = { "c", "lua", "python", "cpp", "query", "markdown", "markdown_inline", "javascript", "go" },
--         highlight = { enable = true },
--       })
--     end,
--   }
-- })

vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
  },
})

require("nvim-treesitter").setup({
  ensure_installed = {
    "c",
    "lua",
    "python",
    "cpp",
    "query",
    "markdown",
    "markdown_inline",
    "javascript",
    "go",
    "gowork",
    "gomod",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "lua", "python", "cpp", "query", "markdown", "markdown_inline", "javascript", "go", "gomod", "gowork" },
  callback = function(args)
    vim.treesitter.start(args.buf)
  end,
})

vim.pack.add({
  { src = "https://github.com/windwp/nvim-autopairs" },
})
require("nvim-autopairs").setup()

vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

vim.pack.add({
  { src = "https://github.com/OXY2DEV/markview.nvim" },
})

vim.pack.add({
  { src = "https://github.com/akinsho/bufferline.nvim" },
})

-- vim.pack.add({
--   { src = "https:/github.com/rebelot/terminal.nvim"},
-- })

vim.opt.termguicolors = true
require("bufferline").setup({
  options = {
    themable = true,

    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",

    mode = "buffers",

    offsets = {
      {
        filetype = "neo-tree",
        separator = true,
        padding = 1,
      },
    },

    buffer_close_icon = "󰅖",
    modified_icon = "● ",
    close_icon = " ",
    left_trunc_marker = " ",
    right_trunc_marker = " ",

    diagnostics = "nvim_lsp",

    indicator = {
      icon = "  ",
      style = "icon",
    },
  },
})

vim.pack.add({
  { src = "https://github.com/linux-cultist/venv-selector.nvim" },
})

require("venv-selector").setup({
  ft = "python",                              -- Load when opening Python files
  -- keys = { { "<Leader>vs", "<cmd>VenvSelect<cr>" } }, -- Open picker on keymap
  opts = {
    options = {},                             -- plugin-wide options
    search = {}                               -- custom search definitions
  },
})

vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

local actions = require('fzf-lua.actions')
require('fzf-lua').setup({
    winopts = { backdrop = 85 },
    -- keymap = {
    --     builtin = {
    --         ["<C-f>"] = "preview-page-down",
    --         ["<C-b>"] = "preview-page-up",
    --         ["<C-p>"] = "toggle-preview",
    --     },
    --     fzf = {
    --         ["ctrl-a"] = "toggle-all",
    --         ["ctrl-t"] = "first",
    --         ["ctrl-g"] = "last",
    --         ["ctrl-d"] = "half-page-down",
    --         ["ctrl-u"] = "half-page-up",
    --     }
    -- },
    -- actions = {
    --     files = {
    --         ["ctrl-q"] = actions.file_sel_to_qf,
    --         ["ctrl-n"] = actions.toggle_ignore,
    --         ["ctrl-h"] = actions.toggle_hidden,
    --         ["enter"]  = actions.file_edit_or_qf,
    --     }
    -- }
})
