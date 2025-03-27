return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			name = 'telescope-fzf',
			build = 'make',
		},
	},
	cmd = "Telescope",

	opts = {
		pickers = {
			find_files = {
				find_command = { 'rg', '--files' },
			},

			symbols = {
				sources = { 'emoji', 'gitmoji' },
			},
		},
	},

	config = function (self, opts)
		local telescope = require "telescope"
		telescope.setup(opts)
		telescope.load_extension "fzf"
	end,
}
