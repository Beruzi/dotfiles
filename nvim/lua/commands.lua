----------------------
-- Custom Commands
----------------------
-- Reload init.lua
--------->>>>>> I believe this will no longer work now that I use lua modules!
vim.api.nvim_create_user_command("Reload", function()
  dofile(vim.fn.stdpath("config") .. "/init.lua")
  print("Config reloaded!")
end, {})

