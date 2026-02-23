-------------------------
--- [[ vim options ]] ---
-------------------------
vim.opt.termguicolors = true        -- enables 24 bit colors in terminal

vim.opt.number = true               -- show line number in gutter
vim.opt.relativenumber = false       -- show line numbers relative to current line
vim.opt.signcolumn = "yes"          -- extra gutter line for extra info

vim.opt.tabstop = 4 			    -- render tabs (\t) as x spaces
vim.opt.expandtab = true            -- inserting a tab expands as x spaces
vim.opt.shiftwidth = 4			    -- indentation changes shift by x spaces 

vim.opt.autoindent = false 		    -- newlines auto indent to prev line
vim.opt.smartindent = false         -- attempts to smartly indent based on prev char
vim.opt.breakindent = true          -- wrapped lines indent to match

vim.opt.wrap = true				    -- visually wrap line
vim.opt.linebreak = true		    -- lines break at word
vim.opt.smoothscroll = true 	    -- scrolls via screen lines (for "wrap")

vim.opt.cmdheight = 2 			    -- cmd line height

vim.opt.cursorline = true 
vim.opt.cursorlineopt = "number"  -- highlights the line number

vim.opt.scrolloff = 5

-- Menu Popup Completion
vim.opt.completeopt = { "fuzzy", "menuone", "noselect", "preview" }
vim.opt.pumheight = 5           -- size of popup memu

-- Comandline Completion
vim.opt.wildoptions = { "fuzzy", "pum", "tagfile" }
vim.opt.wildmode = { "full" }


