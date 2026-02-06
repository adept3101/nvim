vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
            themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
            -- numbers = "buffer_id",
            close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
            right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
            left_mouse_command = "buffer %d",
		mode = "buffers",
		offsets = {
			{
				filetype = "neo-tree",
				separator = true,
				padding = 1,
			},
		},
buffer_close_icon = '󰅖',
            modified_icon = '● ',
            close_icon = ' ',
            left_trunc_marker = ' ',
            right_trunc_marker = ' ',
		diagnostics = "nvim_lsp",
		indicator = {
			icon = "  ",
			style = "icon",
		},
		-- separator_style = "slope"
	},
})
