-----------------------
-- LSP Config
-----------------------
vim.pack.add({"https://github.com/neovim/nvim-lspconfig"})

local on_attach = function(client, bufnr)
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
    map("n", "<leader>sh", vim.lsp.buf.signature_help, opts)-- Signature help

    if vim.lsp.completion then
        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end

    vim.api.nvim_create_autocmd("InsertCharPre", {
        buffer = bufnr,
        callback = function()
            if vim.v.char == "(" or vim.v.char == "," then
                vim.schedule(function()
                    if vim.api.nvim_get_current_buf() == bufnr then
                        vim.lsp.buf.signature_help()
                    end
                end)
            end
        end,
    })
end

-- Get LSPs
vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
    },
    root_markers = { "compile_commands.json", ".clangd", ".git" },
    on_attach = on_attach,
})
vim.lsp.config("html", { on_attach = on_attach })
vim.lsp.config("cssls", { on_attach = on_attach })
vim.lsp.config("ts_ls", { on_attach = on_attach })
vim.lsp.config("pyright", { on_attach = on_attach })

-- Enable Specific LSPs
vim.lsp.enable("clangd")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("pyright")
