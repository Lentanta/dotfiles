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

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)


