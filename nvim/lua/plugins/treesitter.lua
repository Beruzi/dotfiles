vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    branch = "main",
  },
})

local nts = require("nvim-treesitter")

nts.setup()

nts.install({
  "lua",
  "c", "cpp",
  "html", "css",
  "javascript", "typescript", "tsx",
  "zig",
  "python",
  "yaml",
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
