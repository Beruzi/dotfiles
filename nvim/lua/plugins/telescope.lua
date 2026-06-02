---------------------------
-- Telescope Fuzzy Finder
---------------------------
vim.pack.add({
    {
        src = "https://github.com/nvim-telescope/telescope.nvim",
        version = "7d324792b7943e4aa16ad007212e6acc6f9fe335",
    },
    {
        src = "https://github.com/nvim-lua/plenary.nvim",
        version = "74b06c6c75e4eeb3108ec01852001636d85a932b",
    },
})

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>",  { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>",   { desc = 'Telescope live grep' })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>",     { desc = 'Telescope buffers' })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>",   { desc = 'Telescope help tags' })



