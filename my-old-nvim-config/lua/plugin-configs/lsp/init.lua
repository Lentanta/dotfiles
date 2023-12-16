local lspconfig = require("lspconfig")
local utils = require("../../utils")

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
  return {
    noremap = noremap,
    silent = silent,
    buffer = buffer,
  }
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local bufopts = create_buffer_options(true, true, bufnr)
  local keymap = utils.keymap
  local normal = utils.normal_mode
  local format = function()
    vim.lsp.buf.format({ async = true })
  end

  keymap(normal, "gD", vim.lsp.buf.declaration, bufopts)
  keymap(normal, "gd", vim.lsp.buf.definition, bufopts)
  keymap(normal, "K", vim.lsp.buf.hover, bufopts)
  keymap(normal, "gi", vim.lsp.buf.implementation, bufopts)
  keymap(normal, "<A-i>", format, bufopts)
  keymap(normal, "<leader>f", format, bufopts)

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
-- For Lua
lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
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

-- For typescript
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- For CSS
lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- For HTML
lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
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
