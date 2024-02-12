local lazy = require 'yakubiv.plugins.lazy'

lazy.setup {
	'gpanders/editorconfig.nvim',

	--- Completion
	{
		'windwp/nvim-autopairs',
		opts = {}
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'LuaSnip', -- config file requires snippet engine loaded
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'hrsh7th/cmp-emoji' },
		},
		init = function () require 'yakubiv.plugins.cmp' end,
	},

	--- Snippets
	'L3MON4D3/LuaSnip', -- snippet engine
	'rafamadriz/friendly-snippets', -- a community-driven set of snippets

	--- Language Server Protocol (LSP)
	'williamboman/mason.nvim', -- language servers package manager
	{ 'williamboman/mason-lspconfig.nvim', after = 'mason.nvim' },
	{ -- enable LSP
		'neovim/nvim-lspconfig',
		dependencies = { 'mason.nvim', 'mason-lspconfig.nvim' },
		init = function () require 'yakubiv.plugins.lspconfig' end, -- sets up mason too
	},

	--- Interface
	{ 'nvim-lualine/lualine.nvim', opts = {} },
	{ 'nvim-tree/nvim-tree.lua', init = function () require 'yakubiv.plugins.tree' end },
	{
		'stevearc/oil.nvim',
		init = function () require 'yakubiv.plugins.oil' end,
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	{
		'f-person/auto-dark-mode.nvim',
		opts = {},
	},
	{ 'catppuccin/nvim', name = 'catppuccin' },

	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		init = function () require 'yakubiv.plugins.telescope' end,
	},
	'nvim-telescope/telescope-symbols.nvim',
	'olacin/telescope-gitmoji.nvim',
	{
		'nvim-treesitter/nvim-treesitter',
		name = 'treesitter',
		init = function () require 'yakubiv.plugins.treesitter' end,
		build = function()
			local ts_update = require('nvim-treesitter.install').update()
			ts_update()
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		name = 'treesitter-context',
		dependencies = 'nvim-treesitter/nvim-treesitter',
		after = 'treesitter',
	},
	{
		'https://github.com/Wansmer/treesj',
		dependencies = 'nvim-treesitter/nvim-treesitter',
		after = 'treesitter',
	},
	{ 'numToStr/Comment.nvim', init = function () require 'yakubiv.plugins.comment' end },
	{ 'lewis6991/gitsigns.nvim', init = function () require 'yakubiv.plugins.gitsigns' end },

	--- Syntax
	'dannywillems/vim-icalendar',
	{
		'nvim-neorg/neorg',
		init = function () require 'yakubiv.plugins.neorg' end,
		build = ':Neorg sync-parsers',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-cmp',
		},
	},
}
