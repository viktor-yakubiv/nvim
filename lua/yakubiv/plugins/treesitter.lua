return {
	{
		'nvim-treesitter/nvim-treesitter',
		name = 'treesitter',
		main = 'nvim-treesitter.configs',
		opts = {},

		build = function ()
			require('nvim-treesitter.install').update({ with_sync = true })()
		end,
	},

	{
		'nvim-treesitter/nvim-treesitter-context',
		name = 'treesitter-context',
		dependencies = 'nvim-treesitter/nvim-treesitter',
		event = "BufEnter",
	},
}
