local o = vim.opt

-- global options
o.number          = true
o.relativenumber  = true
o.cursorline      = false
o.backup          = false
o.termguicolors   = true
o.encoding        = "utf-8"
o.mouse           = "a"
o.cmdheight       = 2
o.updatetime      = 300 -- For faster update (defaut is 4000)

o.autoindent      = true
o.smartindent     = true

o.expandtab       = true
o.smarttab        = true
o.showtabline     = 2
o.tabstop         = 2
o.softtabstop     = 2
o.shiftwidth      = 2

o.list            = true
o.listchars       = { tab = "»·", trail = "·" }
o.clipboard       = "unnamedplus"

