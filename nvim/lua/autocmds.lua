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


--- Markdown List Intelligent Indent
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt_local.breakindentopt = "shift:0,min:20,list:-1"

    vim.opt_local.formatlistpat =
      [[^\s*\(\d\+\.\s\+\|[-*+]\(\s\[[ xX]\]\)\?\s\+\)]]
  end,
})


--- Lets '>>' shift hashtag-prefixed lines (historically, compilers required that these lines start in column 0, however modern compilers do not care
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
      vim.opt_local.cinkeys:remove("0#")
  end,
})

