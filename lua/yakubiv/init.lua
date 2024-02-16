local plugins = require 'yakubiv.plugins'

plugins.use {
	'gpanders/editorconfig.nvim',

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

plugins.use {
	plugins.tree,
	plugins.oil,
	plugins.comment,
	plugins.lspconfig,
	plugins.treesitter,
	plugins.telescope,
}

require 'yakubiv.options'
require 'yakubiv.appearance'
require 'yakubiv.keymaps'

plugins.setup()
