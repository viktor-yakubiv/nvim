return {
	-- Automatic system appearance detection
	-- For some reason Neovim does not pick it properly from the terminal
	{ 'f-person/auto-dark-mode.nvim', opts = {}, lazy = false },

	-- Better status line
	{ 'nvim-lualine/lualine.nvim', opts = {}, lazy = false },

	-- Indicate line changes next to the number
	{
		'lewis6991/gitsigns.nvim',
		event = "BufEnter",
		opts = {},
	},

	-- Catppuccin is my primary color scheme currently.
	-- Previously, I have used (in chronological order):
	-- * Monokai Pro
	-- * Mariana and Brackets, standard dark and light schemes of Sublime Text 4
	-- * Stim — my own color scheme, Mariana ported to terminal colours
	{ 'catppuccin/nvim', name = 'catppuccin' },
}
