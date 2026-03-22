----------------------
-- Custom Commands
----------------------
-- Reload init.lua

---I BELIEVE THIS WILL NO LONGER WORK NOW THAT I USE LUA MODULES!
vim.api.nvim_create_user_command("Reload", function()
  dofile(vim.fn.stdpath("config") .. "/init.lua")
  print("Config reloaded!")
end, {})

