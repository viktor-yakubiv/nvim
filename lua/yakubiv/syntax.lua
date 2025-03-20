local plugins = require "yakubiv.plugins"

plugins.treesitter.setup {
	ensure_installed = {
		-- Editor configuration and help files
		"vim",
		"vimdoc",
		"lua",
		"regex", -- required by noice.nvim

		-- Primary languages
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
