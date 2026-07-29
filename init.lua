require("core")

require("plugins")

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim' ,branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use 'nvim-treesitter/nvim-treesitter' -- my goat
	use 'xiyaowong/transparent.nvim' -- so it look clean
	use 'EdenEast/nightfox.nvim' -- main theme
	use 'nvim-tree/nvim-web-devicons' -- pretty icons for other things
	use 'nvim-mini/mini.files' -- better file browser that still works like vim
	use 'norcalli/nvim-colorizer.lua' -- color previews
	use 'nvim-lualine/lualine.nvim' -- status bar at bottom
	use 'mbbill/undotree' -- local git
end)
