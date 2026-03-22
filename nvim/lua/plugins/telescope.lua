---------------------------
-- Telescope Fuzzy Finder
---------------------------
vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim",
    'https://github.com/nvim-lua/plenary.nvim',
})

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>",  { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>",   { desc = 'Telescope live grep' })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>",     { desc = 'Telescope buffers' })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>",   { desc = 'Telescope help tags' })




