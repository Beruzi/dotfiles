
-----------------------
-- LSP Config
-----------------------
vim.pack.add({"https://github.com/neovim/nvim-lspconfig"})

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local map = vim.keymap.set
    map("n", "gd", vim.lsp.buf.definition, opts)            -- Go to definition
    map("n", "gq", vim.lsp.buf.format, opts)                -- Format
    map("n", "K", vim.lsp.buf.hover, opts)                  -- Hover docs
    map("n", "gr", vim.lsp.buf.references, opts)            -- Find references
    map("n", "gi", vim.lsp.buf.implementation, opts)        -- Go to implementation
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)        -- Rename
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)   -- Code actions
    map("n", "[d", vim.diagnostic.goto_prev, opts)          -- Prev diagnostic
    map("n", "]d", vim.diagnostic.goto_next, opts)          -- Next diagnostic
end

vim.lsp.config("lua_ls", { on_attach = on_attach })
vim.lsp.config("clangd", { on_attach = on_attach })

--vim.lsp.config("clangd", { 
--    on_attach = on_attach,  
--    cmd = {
--        "clangd",
--        "--fallback-style=LLVM",
--        "--fallback-flags=-std=c++17",
--    }
--})
vim.lsp.config("html", { on_attach = on_attach })
vim.lsp.config("cssls", { on_attach = on_attach })
vim.lsp.config("ts_ls", { on_attach = on_attach })

-- Enable Specific LSPs
vim.lsp.enable("clangd")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
