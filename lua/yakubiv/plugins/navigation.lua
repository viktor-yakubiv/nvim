return {
	{
		'nvim-tree/nvim-tree.lua',
		name = "tree",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			ui = {
				confirm = {
					default_yes = true,
				},
			},
		},
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		name = "neotree",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {},
	},
}


-- Keymaps
-- local api = require 'nvim-tree.api'
-- vim.keymap.set('n', '<leader>tf', api.tree.focus)
-- vim.keymap.set('n', '<leader>tt', api.tree.toggle)
