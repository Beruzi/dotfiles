vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "c", "cpp",
    "html", "css",
    "javascript", "typescript", "tsx",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = false },
})
