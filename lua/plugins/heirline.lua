-- dharmx minimal feline config
local present, feline = pcall(require, "feline")
if not present then return end

local theme = {
  aqua = "#7AB0DF",
  bg = "#1C212A",
  blue = "#5FB0FC",
  cyan = "#70C0BA",
  darkred = "#FB7373",
  fg = "#C7C7CA",
  gray = "#222730",
  green = "#79DCAA",
  lime = "#54CED6",
  orange = "#FFD064",
  pink = "#D997C8",
  purple = "#C397D8",
  red = "#F87070",
  yellow = "#FFE59E",
}

local mode_theme = {
  ["NORMAL"] = theme.green,
  ["OP"] = theme.cyan,
  ["INSERT"] = theme.aqua,
  ["VISUAL"] = theme.yellow,
  ["LINES"] = theme.darkred,
  ["BLOCK"] = theme.orange,
  ["REPLACE"] = theme.purple,
  ["V-REPLACE"] = theme.pink,
  ["COMMAND"] = theme.blue,
  ["TERM"] = theme.lime,
  ["NONE"] = theme.gray,
}

local modes = setmetatable({
  ["n"] = "N", ["i"] = "I", ["v"] = "V", -- и т.д.
}, { __index = function() return "-" end })

local component = {}
component.vim_mode = {
  provider = function() return modes[vim.api.nvim_get_mode().mode] end,
  hl = function()
    return { fg = "bg", bg = require("feline.providers.vi_mode").get_mode_color(), style = "bold" }
  end,
  left_sep = "block", right_sep = "block",
}

-- Добавлены git_branch, diagnostics, lsp, file_type, scroll_bar и т.д.
-- полный код вы можете посмотреть в оригинале

vim.api.nvim_set_hl(0, "StatusLine", { bg = "#101317", fg = "#7AB0DF" })
feline.setup({
  components = { active = { {}, {}, {
    component.vim_mode, component.file_type, component.lsp,
    component.git_branch, component.git_add, component.git_delete,
    component.git_change, component.separator,
    component.diagnostic_errors, component.diagnostic_warnings,
    component.diagnostic_info, component.diagnostic_hints,
    component.scroll_bar,
  } } },
  theme = theme,
  vi_mode_colors = mode_theme,
})

