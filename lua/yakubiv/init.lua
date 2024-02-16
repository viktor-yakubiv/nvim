local plugins = require 'yakubiv.plugins'

plugins.use {
	--- Completion
	{ 'windwp/nvim-autopairs', config = true },

	-- Editing
	{
		'https://github.com/Wansmer/treesj',
		dependencies = 'nvim-treesitter/nvim-treesitter',
	},

	--- Syntax
	'dannywillems/vim-icalendar',
}

plugins.enable {
	"cmp",
	"tree",
	"oil",
	"comment",
	"lspconfig",
	"treesitter",
	"telescope",
	"which_key",
}

require 'yakubiv.options'
require 'yakubiv.appearance'
require 'yakubiv.keymaps'

plugins.load()
