return {
  -- vim.lsp.config('rust-analyzer')
  -- cmd = { 'rust-analyzer' },
  -- filetypes = { 'rust' },
  -- root_markers = { 'Cargo.toml' }

vim.lsp.config('rust_analyzer', {
    settings = {
      ['rust-analyzer'] = {
        diagnostics = {
          enable = false;
        }
      }
    }
  })


}
