local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Modes
local normal = "n"
local insert = "i"
local visual = "v"

-- NvimTree
keymap(normal, "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap(normal, "<C-f>", ":NvimTreeFocus<CR>", opts)
