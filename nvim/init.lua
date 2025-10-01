
-------------------------
--- [[ vim options ]] ---
-------------------------
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.autocomplete = true
vim.opt.complete = { ".^5", "w^5", "b^5", "u^5" }

vim.opt.tabstop = 4 			-- render tabs as x spaces
vim.opt.shiftwidth = 4			-- inserted tabs are x spaces in size

vim.opt.autoindent = true 		-- newlines auto indent
vim.opt.smartindent = false
vim.opt.cindent = false;
vim.opt.breakindent = true

vim.opt.wrap = true				-- visually wrap line
vim.opt.linebreak = true		-- lines break at word
vim.opt.smoothscroll = true 	-- scrolls via screen lines (for "wrap")

vim.opt.cmdheight = 2 			-- cmd line height

vim.opt.cursorline = true 
vim.opt.cursorlineopt = {"number"} -- highlights the line number

-- vim.opt.spell = false		-- enables spell check
-- vim.opt.spelloptions = {"camel"}


-------------------------
--- [[ vim keymaps ]] ---
-------------------------
--- Set leader key to space & it perform no operation in modes
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
vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, silent = true })

vim.keymap.set("i", "<S-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, silent = true })

-----------------------------
--- [[ custom commands ]] ---
-----------------------------
-- Reload init.lua
vim.api.nvim_create_user_command("Reload", function()
  dofile(vim.fn.stdpath("config") .. "/init.lua")
  print("Config reloaded!")
end, {})

-- Competitive Programming Skeleton
vim.api.nvim_create_user_command("CPSkeleton", function()
  local lines = {
    "#include <bits/stdc++.h>",
    "using namespace std;",
    "",
    "int main() {",
    "    std::ios::sync_with_stdio(false);",
    "    std::cin.tie(nullptr);",
    "    ",
    "    ",
    "    return 0;",
    "}",
  }
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row, row, false, lines)
end, {})


-----------------------------
----- [[ Treesitter ]] ------
-----------------------------
vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})
require("nvim-treesitter.configs").setup({
	ensure_installed = { 
	--	"lua", 
		"c", 
		"cpp",
	--	"python", 
	--	"html",
	--	"css", 
	--	"javascript", 
	--	"markdown",
	},
	highlight = { 
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
})

-----------------------------
-------- [[ LSPs ]] ---------
-----------------------------
vim.pack.add({"https://github.com/neovim/nvim-lspconfig"})

vim.lsp.config("clangd", {})
--vim.lsp.config("lua_ls", {})
--vim.lsp.config("marksman", {})
--vim.lsp.config("pyright", {})
--vim.lsp.config("html", {})
--vim.lsp.config("cssls", {})
--vim.lsp.config("tsserver", {})

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  local map = vim.keymap.set

  map("n", "K", vim.lsp.buf.hover, opts)                  -- Hover docs
  map("n", "gd", vim.lsp.buf.definition, opts)            -- Go to definition
  map("n", "gr", vim.lsp.buf.references, opts)            -- Find references
  map("n", "gi", vim.lsp.buf.implementation, opts)        -- Go to implementation
  map("n", "<leader>rn", vim.lsp.buf.rename, opts)        -- Rename
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)   -- Code actions
  map("n", "[d", vim.diagnostic.goto_prev, opts)          -- Prev diagnostic
  map("n", "]d", vim.diagnostic.goto_next, opts)          -- Next diagnostic
end

-- Enable Specific LSPs
vim.lsp.config("clangd", { on_attach = on_attach })
--vim.lsp.enable("lua_ls")
--vim.lsp.enable("marksman")
--vim.lsp.enable("pyright")
--vim.lsp.enable("html")
--vim.lsp.enable("cssls")
--vim.lsp.enable("tsserver")


-----------------------------
----[[ fuzzy finder ]] ------
-----------------------------
vim.pack.add({ "https://github.com/echasnovski/mini.nvim" })
require("mini.pick").setup()


-- Mini.pick relies on 1 of 3 dependecies to perform the actual search: ripgrep, fd, git... 
-- So basically get ripgrep... git would be fine, except requires git repos
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



