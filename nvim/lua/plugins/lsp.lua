-----------------------
-- LSP Config
-----------------------
vim.pack.add({"https://github.com/neovim/nvim-lspconfig"})


-- Global autocomplete state: OFF by default
vim.g.lsp_autocomplete_enabled = false

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local map = vim.keymap.set

    -- Navigation
    map("n", "gd", vim.lsp.buf.definition, opts)            -- Go to definition
    map("n", "gD", vim.lsp.buf.declaration, opts)           -- Go to declaration
    --map("n", "gi", vim.lsp.buf.implementation, opts)      -- Go to implementation ; use the default "gri"
    --map("n", "gr", vim.lsp.buf.references, opts)          -- Find references      ; use the default "grr"

    -- Actions
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)        -- Rename
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)   -- Code actions
    -- vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()" -- Lets gq use LSP as format engine
    map("n", "gq", vim.lsp.buf.format, opts)             -- Format

    -- Diagnostics
    map("n", "[d", vim.diagnostic.goto_prev, opts)          -- Prev diagnostic
    map("n", "]d", vim.diagnostic.goto_next, opts)          -- Next diagnostic
    map("n", "<leader>e", vim.diagnostic.open_float, opts)  -- Line Diagnostic Popup
    map("n", "<leader>q", vim.diagnostic.setloclist, opts)  -- Diagnostic List

    -- Docs / help
    map("n", "K", vim.lsp.buf.hover, opts)                  -- Hover docs
    map("n", "<leader>sh", vim.lsp.buf.signature_help, opts)-- Signature help

    -- Toggle blink-powered autocomplete / hints
    map("n", "<leader>ta", function()
        vim.g.lsp_autocomplete_enabled = not vim.g.lsp_autocomplete_enabled
        vim.notify("Blink autocomplete " .. (vim.g.lsp_autocomplete_enabled and "ON" or "OFF"))
    end, opts)
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
vim.lsp.config("docker_language_server", { on_attach = on_attach })
vim.lsp.config("docker_compose_language_server", { on_attach = on_attach })

-- Enable Specific LSPs
vim.lsp.enable("clangd")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("docker_language_server")
vim.lsp.enable("docker_compose_language_server")
