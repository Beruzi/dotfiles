vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
    },
})

local ts = require("nvim-treesitter")

ts.install({
    "lua",
    "c",
    "cpp",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "zig",
    "python",
    "yaml",
    "markdown",
    "markdown_inline",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "lua",
        "c",
        "cpp",
        "html",
        "css",
        "javascript",
        "typescript",
        "typescriptreact",
        "zig",
        "python",
        "yaml",
        "markdown",
    },
    callback = function()
        vim.treesitter.start()
    end,
})
