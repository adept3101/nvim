vim.lsp.config['rust-analyzer'] = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', 'rust-project.json' },
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false,
      },
    }
  }
}

vim.lsp.enable({
  "clangd",
  "rust-analyzer",
  "lua_ls",
  "pyright",
})

vim.diagnostic.config({ virtual_text = true })
