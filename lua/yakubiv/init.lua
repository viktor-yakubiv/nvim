local plugins = require 'yakubiv.plugins'

plugins.use {
	--- Syntax
	'dannywillems/vim-icalendar',
}

plugins.enable {
	"autopairs",
	"treesj",
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
