local configs = require 'nvim-treesitter.configs'

configs.setup {
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

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indend = {
		enable = true,
	},
}
