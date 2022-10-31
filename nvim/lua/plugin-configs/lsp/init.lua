local lspconfig = require("lspconfig")

-- Suport methods
local FORMATTING = "textDocument/formatting"

-- For formatting with null-ls
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local create_buffer_options = function(noremap, silent, buffer)
  return { noremap = noremap, silent = silent, buffer = buffer }
end
local normal = "n"

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local bufopts = create_buffer_options(true, true, bufnr)
  local set_key_map = vim.keymap.set

  set_key_map(normal, "gD", vim.lsp.buf.declaration, bufopts)
  set_key_map(normal, "gd", vim.lsp.buf.definition, bufopts)
  set_key_map(normal, "K", vim.lsp.buf.hover, bufopts)
  set_key_map(normal, "gi", vim.lsp.buf.implementation, bufopts)

  -- If client support formatting
  if client.supports_method(FORMATTING) then
    vim.api.nvim_clear_autocmds({
      -- group = augroup,
      buffer = bufnr,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      -- group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

-- Setup for each languages
lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})

-- LSP icons
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

-- Set LSP icons
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, {
    texthl = sign.name,
    text = sign.text,
    numhl = "",
  })
end
