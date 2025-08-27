-- [[ vim options ]]
vim.opt.number = true
vim.opt.relativenumber = true

-- Formatting (spacing)
vim.opt.tabstop = 4 
vim.opt.shiftwidth = 4
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:4"
vim.opt.comments = {"b:-", "b:*"}
vim.opt.autoindent = true
vim.opt.formatoptions:remove("cro")


vim.o.updatetime = 250


-- [[ vim keymaps ]] 
vim.g.mapleader = " "

vim.keymap.set('n', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('v', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('o', '<Space>', '<Nop>', { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "cp", [["+y]])
vim.keymap.set({ "n", "v" }, "cv", [["+p]])

-- Window Stuff
--vim.keymap.set("n", "<leader>vsp", ":vsp:<CR>")
--vim.keymap.set("n", "<leader>sp", ":sp:<CR>")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- Telescope Bindings
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")


-- Format Keymap (if LSPs are installed... there is currently none)
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "Format buffer" })


-- [[ Lazy Boostrap ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- [[ Choose Plugins ]]
require("lazy").setup({
	-- Themes
	{ "folke/tokyonight.nvim" },

	-- [[ Plugins ]]
	{ "neovim/nvim-lspconfig" },
  	{ "nvim-treesitter/nvim-treesitter", event = {"BufReadPost", "BufNewFile"}, branch="master", lazy="true", build=":TSUpdate" },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "ThePrimeagen/harpoon" }
})

-- [[ Tree Sitter ]]
require("nvim-treesitter.configs").setup({
  ensure_installed = { 
				"lua", 
				"vim", 
				"vimdoc", 
				"c", 
				"cpp",
				"python", 
				"html",
				"css", 
				"javascript", 
				"ocaml"
				},
  highlight = { enable = true },
  indent = { enable = true },
})

-- [[ Set Theme ]]
vim.cmd.colorscheme("tokyonight-night")
