return {
	{
		'nvim-treesitter/nvim-treesitter',
		name = 'treesitter',
		opts = {},

		config = function (self, opts)
			local configs = require 'nvim-treesitter.configs'
			configs.setup(opts)
		end,

		build = function ()
			require('nvim-treesitter.install').update({ with_sync = true })()
		end,
	},

	{
		'nvim-treesitter/nvim-treesitter-context',
		name = 'treesitter-context',
		dependencies = 'nvim-treesitter/nvim-treesitter',
	},

	-- I edit iCalendar files sometimes
	{ 'dannywillems/vim-icalendar', name = "icalendar", ft = "icalendar" },
}
