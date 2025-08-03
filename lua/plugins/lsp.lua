local lspconfig = require('lspconfig')
lspconfig.clangd.setup ({
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
})
lspconfig.pyright.setup ({})
lspconfig.ts_ls.setup {}
