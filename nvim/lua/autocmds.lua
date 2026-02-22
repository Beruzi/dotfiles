-------------------
-- Auto Commands
------------------
-- On LSP attach, tell nvim to use omni-completion
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
  end,
})

