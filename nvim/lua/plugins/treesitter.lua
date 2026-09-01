vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "cf12346a3414fa1b06af75c79faebe7f76df080a",
  },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "c", "cpp",
    "html", "css",
    "javascript", "typescript", "tsx",
    "zig",
    "python",
    "yaml",
  },
  highlight = {
    enable = true,
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "c", "cpp",
    "html", "css",
    "javascript", "typescript", "typescriptreact",
    "zig",
    "python",
    "yaml",
  },
  callback = function()
    vim.treesitter.start()
  end,
})
