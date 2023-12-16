local utils = {}

utils.keymap = vim.keymap.set
utils.opts = { noremap = true, silent = true }

utils.normal_mode = "n"
utils.visual_mode = "v"
utils.insert_mode = "i"

return utils
