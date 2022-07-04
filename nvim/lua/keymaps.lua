local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
local normal = "n"
local insert = "i"
local visual = "v"

-- Remove search hightlight
keymap(normal, "<Esc>", ":nohlsearch<CR>", opts)

-- NvimTree
keymap(normal, "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap(normal, "<C-f>", ":NvimTreeFocus<CR>", opts)

-- Telescope
keymap(
  normal, 
  "<leader>ff", 
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
