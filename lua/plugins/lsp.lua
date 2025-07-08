local lspconfig = require('lspconfig')
lspconfig.clangd.setup ({
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")
})
lspconfig.pyright.setup ({})
--lspconfig.tsserver.setup {}
