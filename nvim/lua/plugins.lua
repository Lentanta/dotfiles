-- Protected call require packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Packer not working")
  return
end

-- Install plugins here
return packer.startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'tanvirtin/monokai.nvim'

  -- Status line
  use 'nvim-lualine/lualine.nvim'

  -- Nvim tree
  use 'kyazdani42/nvim-tree.lua'

  -- Nvim treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
end)


