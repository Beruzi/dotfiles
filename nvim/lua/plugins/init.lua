require("plugins.treesitter")
require("plugins.lsp")

-----------------------------
----[[ fuzzy finder ]] ------
-----------------------------
vim.pack.add({ "https://github.com/echasnovski/mini.nvim" })
require("mini.pick").setup()

-- Mini.pick relies on 1 of 3 dependencies to perform search: ripgrep, fd, git
vim.keymap.set("n", "<leader>ff", function() MiniPick.builtin.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fb", function() MiniPick.builtin.buffers() end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fg", function() MiniPick.builtin.grep_live() end, { desc = "Live grep" })

-----------------------------
-------- [[ Themes ]] -------
-----------------------------
vim.pack.add({"https://github.com/folke/tokyonight.nvim"})
vim.pack.add({"https://github.com/bluz71/vim-moonfly-colors"})
vim.pack.add({"https://github.com/cocopon/iceberg.vim"})

vim.cmd.colorscheme("tokyonight-night")
--vim.cmd.colorscheme("moonfly")
--vim.cmd.colorscheme("iceberg")
