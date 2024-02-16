local treesitter_config = {
	ensure_installed = {
		"html",
		"css",
		"javascript",
		"jsdoc",
		"typescript",
		"tsx",

		"markdown",
		"bash",
		"yaml",
	},

	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = { enable = true },
}

local treesitter_plugin = {
	'nvim-treesitter/nvim-treesitter',
	name = 'treesitter',
	opts = treesitter_config,

	config = function (self, opts)
		local configs = require 'nvim-treesitter.configs'
		configs.setup(opts)
	end,

	build = function ()
		local ts_update = require('nvim-treesitter.install').update()
		ts_update()
	end,
}


local treesitter_context_plugin = {
	'nvim-treesitter/nvim-treesitter-context',
	name = 'treesitter-context',
	dependencies = 'nvim-treesitter/nvim-treesitter',
}


return {
	treesitter_plugin,
	treesitter_context_plugin,
}
