vim.pack.add({
  {
    src = "https://github.com/Saghen/blink.cmp",
    version = "78336bc89ee5365633bcf754d93df01678b5c08f",
  },
})

require("blink.cmp").setup({
  enabled = function()
    return vim.g.lsp_autocomplete_enabled
  end,

  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
  },

  completion = {
    list = {
      selection = {
        preselect = true,
        auto_insert = true,
      },
    },

    menu = {
      auto_show = true,
    },

    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },

  signature = {
    enabled = true,
  },

  sources = {
    default = { "lsp", "path", "buffer", "snippets" },
  },

  fuzzy = {
    implementation = "lua",
  },
})
