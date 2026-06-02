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
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = false },
})
