vim.pack.add({
  { src = "https://github.com/Saghen/blink.cmp", version = "v1" },
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
