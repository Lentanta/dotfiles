local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local stylua_config = {
  extra_args = {
    "--indent-type",
    "Spaces",
    "--indent-width",
    2,
  },
}

null_ls.setup({
  debug = false,
  sources = {
    formatting.stylua.with(stylua_config),
    formatting.prettier,
  },
})
