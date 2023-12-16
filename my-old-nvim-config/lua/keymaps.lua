local utils = require("utils")
--Remap space as leader key

local keymap = utils.keymap
local opts = utils.opts

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
local normal = utils.normal_mode

-- Remove search hightlight
keymap(normal, "<Esc>", ":nohlsearch<CR>", opts)

-- NvimTree
keymap(normal, "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap(normal, "<C-f>", ":NvimTreeFocus<CR>", opts)

keymap(normal, "<A-i>", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
keymap(normal, "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
