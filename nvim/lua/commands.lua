----------------------
-- Custom Commands
----------------------

-- Reload config
vim.api.nvim_create_user_command("Reload", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^plugins")
      or name:match("^autocmds$")
      or name:match("^commands$")
      or name:match("^keymaps$") then
      package.loaded[name] = nil
    end
  end

  dofile(vim.fn.stdpath("config") .. "/init.lua")
  vim.notify("Config reloaded!")
end, {})

-- Toggle Blink Autocomplete
vim.api.nvim_create_user_command("Autocomplete", function(opts)
    local arg = opts.args

    if arg == "on" then
        vim.g.lsp_autocomplete_enabled = true
    elseif arg == "off" then
        vim.g.lsp_autocomplete_enabled = false
    elseif arg == "toggle" then
        vim.g.lsp_autocomplete_enabled = not vim.g.lsp_autocomplete_enabled
    else
        vim.notify("Use :Autocomplete on|off|toggle", vim.log.levels.ERROR)
        return
    end

    vim.notify("Blink autocomplete " .. (vim.g.lsp_autocomplete_enabled and "ON" or "OFF"))
end, {
    nargs = 1,
    complete = function()
        return { "on", "off", "toggle" }
    end,
})
