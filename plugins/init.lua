local packer = require('plugins.packer')

packer.auto_sync = true

packer.startup(function (use)
	use 'gpanders/editorconfig.nvim'

	--- Completion
	use {
		'hrsh7th/nvim-cmp',
		after = 'LuaSnip', -- config file requires snippet engine loaded
		config = [[require 'plugins.cmp']],
	}
	use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
	use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
	use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }
	use { 'saadparwaiz1/cmp_luasnip', after = { 'nvim-cmp', 'LuaSnip' } }
	use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
	use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
	use { 'hrsh7th/cmp-emoji', after = 'nvim-cmp' }

	--- Snippets
	use 'L3MON4D3/LuaSnip' -- snippet engine
	use 'rafamadriz/friendly-snippets' -- a community-driven set of snippets

	--- Language Server Protocol (LSP)
	use 'williamboman/mason.nvim' -- language servers package manager
	use { 'williamboman/mason-lspconfig.nvim', after = 'mason.nvim' }
	use { -- enable LSP
		'neovim/nvim-lspconfig',
		after = { 'mason.nvim', 'mason-lspconfig.nvim' },
		config = [[require 'plugins.lspconfig']], -- sets up mason too
	}

	--- Interface
	use { 'nvim-lualine/lualine.nvim', config = [[require 'plugins.lualine']] }
	use { 'nvim-tree/nvim-tree.lua', config = [[require 'plugins.tree']] }
	use 'viktor-yakubiv/stim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = [[require 'plugins.telescope']],
	}
	use 'nvim-telescope/telescope-symbols.nvim'
	use 'olacin/telescope-gitmoji.nvim'

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'numToStr/Comment.nvim', config = [[require 'plugins.comment']] }
	use { 'lewis6991/gitsigns.nvim', config = [[require 'plugins.gitsigns']] }

	--- Syntax
	use 'dannywillems/vim-icalendar'
end)

packer.complete()
