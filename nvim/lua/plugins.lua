-- Protected call require packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("Packer not working")
	return
end

-- Auto install
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git', 
		'clone', 
		'--depth', 
		'1', 
		'https://github.com/wbthomason/packer.nvim', 
		install_path
	})
end

-- Install plugins here
return packer.startup(function(use)

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Nvim tree
	use { 
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons'
		},
		tag = 'nightly'
	}

	-- Themes
	use { "ellisonleao/gruvbox.nvim" }

	-- Status line
	use 'nvim-lualine/lualine.nvim'

	-- Nvim treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Cmp plugins
	use "hrsh7th/nvim-cmp"          -- The completion plugin
	use "hrsh7th/cmp-nvim-lsp"      -- lsp completions
	use "hrsh7th/cmp-nvim-lua"      -- nvim lua completions
	use "hrsh7th/cmp-buffer"        -- buffer completions
	use "hrsh7th/cmp-path"          -- path completions
	use "hrsh7th/cmp-cmdline"       -- cmdline completions
	use "saadparwaiz1/cmp_luasnip"  -- snippet completions

	-- Snippets
	use "L3MON4D3/LuaSnip"             -- snippet engine
	use "rafamadriz/friendly-snippets" -- bunch of snippets to use

	-- LSP
	use "neovim/nvim-lspconfig"           -- Install LSP
	use "williamboman/nvim-lsp-installer" -- For simple LSP installer

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 
			{'nvim-lua/plenary.nvim'} 
		}
	}
end)

