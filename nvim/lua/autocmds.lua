-------------------
-- Auto Commands
------------------
-- On LSP attach, tell nvim to use omni-completion
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
  end,
})


-- Refresh the vim buffer to show any changes... for some reason using tmux panes & nvim have issues? This is an attempted fix
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})


