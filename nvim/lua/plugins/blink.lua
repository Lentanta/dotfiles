return {
  "saghen/blink.cmp",
  ---@class PluginLspOpts
  opts = {
    signature = { enabled = true },
    keymap = {
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
  },
}
