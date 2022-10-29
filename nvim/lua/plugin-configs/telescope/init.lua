local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Modes
local normal = "n"
local insert = "i"
local visual = "v"

-- Telescope
keymap(normal, "<leader>ff", ":Telescope find_files<CR>", opts)
