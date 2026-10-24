-----------------------
-- LSP Config
-----------------------
vim.pack.add({
    {
        src = "https://github.com/neovim/nvim-lspconfig",
        version = "9573948c38bfabeec353ae7dd7d3ffec4c506a6b",
    },
})


-- Global autocomplete state:
vim.g.lsp_autocomplete_enabled = true

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local map = vim.keymap.set

    -- Navigation
    map("n", "gd", vim.lsp.buf.definition, opts)                -- Go to definition
    map("n", "gD", vim.lsp.buf.declaration, opts)               -- Go to declaration
    map("n", "<leader>fs", vim.lsp.buf.workspace_symbol, opts)  -- Find workspace symbols
    map("n", "<leader>ci", vim.lsp.buf.incoming_calls, opts)    -- Show incoming calls
    map("n", "<leader>co", vim.lsp.buf.outgoing_calls, opts)    -- Show outgoing calls

    -- Actions
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)            -- Rename
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)       -- Code actions
    vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"     -- Lets gq use LSP as format engine
    map("n", "gq", vim.lsp.buf.format, opts)                    -- Format

    -- Diagnostics
    map("n", "[d", function()
        vim.diagnostic.jump({ count = -1 })
    end, opts)                                                   -- Prev diagnostic
    map("n", "]d", function()
        vim.diagnostic.jump({ count = 1 })
    end, opts)                                                   -- Next diagnostic
    map("n", "<leader>e", vim.diagnostic.open_float, opts)      -- Line Diagnostic Popup
    map("n", "<leader>q", vim.diagnostic.setloclist, opts)      -- Diagnostic List

    -- Docs / help
    map("n", "K", vim.lsp.buf.hover, opts)                      -- Hover docs
    map("n", "<leader>sh", vim.lsp.buf.signature_help, opts)    -- Signature help

    -- Toggle blink-powered autocomplete / hints
    map("n", "<leader>ta", function()
        vim.g.lsp_autocomplete_enabled = not vim.g.lsp_autocomplete_enabled
        vim.notify("Blink autocomplete " .. (vim.g.lsp_autocomplete_enabled and "ON" or "OFF"))
    end, opts)
    map("n", "<leader>th", function()
        local enabled = not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
        vim.lsp.inlay_hint.enable(
            enabled,
            { bufnr = bufnr }
        )
        vim.notify("LSP inlay hints " .. (enabled and "ON" or "OFF"))
    end, opts)                                                    -- Toggle inlay hints
end

-- Prefer a project-local environment, then one active when Neovim starts,
-- and finally the system Python.
local function python_path(root_dir)
    if root_dir then
        -- Prefer conventional names, but do not require a particular venv name.
        for _, env_name in ipairs({ ".venv", "venv", ".env", "env" }) do
            local project_python = root_dir .. "/" .. env_name .. "/bin/python"
            if vim.uv.fs_stat(project_python) then
                return project_python
            end
        end

        -- Every Python venv contains pyvenv.cfg.  Look at direct children of the
        -- project root so environments such as `my-project-env` work without
        -- activating them before Neovim starts.
        local handle = vim.uv.fs_scandir(root_dir)
        if handle then
            while true do
                local name, kind = vim.uv.fs_scandir_next(handle)
                if not name then
                    break
                end

                if kind == "directory" then
                    local env_dir = root_dir .. "/" .. name
                    local project_python = env_dir .. "/bin/python"
                    if vim.uv.fs_stat(env_dir .. "/pyvenv.cfg")
                        and vim.uv.fs_stat(project_python)
                    then
                        return project_python
                    end
                end
            end
        end
    end

    if vim.env.VIRTUAL_ENV then
        local active_python = vim.env.VIRTUAL_ENV .. "/bin/python"
        if vim.uv.fs_stat(active_python) then
            return active_python
        end
    end

    return vim.fn.exepath("python3")
end

------------------------------
--- Activate LSPs
------------------------------
vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
    },
    init_options = {
        fallbackFlags = { "-std=c++20" },
    },
    root_markers = { "compile_commands.json", ".clangd", ".git" },
    on_attach = on_attach,
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
    on_attach = on_attach
})
vim.lsp.config("html", { on_attach = on_attach })
vim.lsp.config("cssls", { on_attach = on_attach })
vim.lsp.config("ts_ls", { on_attach = on_attach })
local python_root_markers = {
    "ty.toml",
    "pyrightconfig.json",
    "pyproject.toml",
    ".venv",
    "venv",
    "requirements.txt",
    "setup.py",
    "setup.cfg",
    ".git",
}

vim.lsp.config("ty", {
    root_markers = python_root_markers,
    settings = {
        ty = { configuration = { environment = {} } },
    },
    before_init = function(_, config)
        config.settings.ty.configuration.environment.python = python_path(config.root_dir)
    end,
    on_attach = on_attach,
})
vim.lsp.config("pyright", {
    root_markers = python_root_markers,
    settings = {
        python = {
            analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
    before_init = function(_, config)
        -- Neovim already shares this table with client.settings. Replacing it
        -- here leaves the client sending the old settings without pythonPath.
        config.settings.python.pythonPath = python_path(config.root_dir)
    end,
    on_attach = on_attach,
})
vim.lsp.config("docker_language_server", { on_attach = on_attach })
vim.lsp.config("docker_compose_language_service", { on_attach = on_attach })

-- Switch for this session; disabling a server also stops its existing clients.
vim.api.nvim_create_user_command("PythonLsp", function(opts)
    if opts.args ~= "ty" and opts.args ~= "pyright" then
        vim.notify("Use :PythonLsp ty|pyright", vim.log.levels.ERROR)
        return
    end
    vim.g.python_lsp = opts.args
    vim.lsp.enable("ty", false)
    vim.lsp.enable("pyright", false)
    vim.lsp.enable(opts.args)
end, {
    nargs = 1,
    complete = function()
        return { "ty", "pyright" }
    end,
    desc = "Select the Python language server for this session",
    force = true,
})

vim.api.nvim_create_user_command("PythonEnv", function()
    local found = false
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
        if client.name == "ty" or client.name == "pyright" then
            found = true
            local python = client.name == "ty"
                and client.settings.ty.configuration.environment.python
                or client.settings.python.pythonPath
            vim.notify(client.name .. " root: " .. (client.config.root_dir or "(none)")
                .. "\nPython: " .. (python or "(server default)"))
        end
    end
    if not found then
        vim.notify("No Python LSP attached to this buffer", vim.log.levels.WARN)
    end
end, { desc = "Show the Python interpreter sent to the Python LSP", force = true })

-- Enable Specific LSPs
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("ts_ls")
vim.lsp.enable(vim.g.python_lsp or "ty")
vim.lsp.enable("docker_language_server")
vim.lsp.enable("docker_compose_language_service")
