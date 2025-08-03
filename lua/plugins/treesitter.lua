require'nvim-treesitter.configs'.setup {

  ensure_installed = { "c", "lua", "python", "cpp", "query", "markdown", "markdown_inline", "javascript" },


  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
}

}
