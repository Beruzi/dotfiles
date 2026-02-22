-------------------------
--- [[ vim keymaps ]] ---
-------------------------
--- Set leader key to space & it perform no operation in modesk
vim.g.mapleader = " "
vim.keymap.set('n', '<Space>', '<Nop>', {noremap = true, silent = true })
vim.keymap.set('v', '<Space>', '<Nop>', {noremap = true, silent = true })
vim.keymap.set('o', '<Space>', '<Nop>', {noremap = true, silent = true })

-- System Clipboard 
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])

-- Windowing
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- Autocomplete dropdown nav
vim.keymap.set("i", "<C-l>", "<C-x><C-o>", { noremap = true, silent = true })
vim.keymap.set("i", "<Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, silent = true })
vim.keymap.set("i", "<S-Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, silent = true })
