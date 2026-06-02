-------------------
-- Themes
-------------------
vim.pack.add({
    {
        src = "https://github.com/folke/tokyonight.nvim",
        version = "cdc07ac78467a233fd62c493de29a17e0cf2b2b6",
    },
})
vim.pack.add({
    {
        src = "https://github.com/bluz71/vim-moonfly-colors",
        version = "261664f92ed51cf0c077555b2d4b2530307eac17",
    },
})

vim.cmd.colorscheme("tokyonight-night")
--vim.cmd.colorscheme("moonfly")
