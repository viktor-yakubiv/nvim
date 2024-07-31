return {
	-- Automatic closing braces and qiotes while coding
	-- Living a year withot this plugin was painful.
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},

	-- Split-join, toggling braces between inline and multiline
	{
		'https://github.com/Wansmer/treesj',
		event = "InsertEnter",
		dependencies = 'nvim-treesitter/nvim-treesitter',
	},

	-- Quick commenting shorttucts
	{
		'numToStr/Comment.nvim',
		name = "comment",
		event = "VeryLazy",
		keys = { "gc", "gb" },
		opts = {},
	},

	-- Formatting for everything
	{
		'stevearc/conform.nvim',
		opts = {},
	},

	-- Edit directory as a normal buffer
	-- Handy to use find and replace or commands like `caw`
	{
		'stevearc/oil.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			default_file_explorer = false,
			view_options = {
				show_hidden = true,
			},
		},
	}
}
