return {
	'nvim-tree/nvim-tree.lua',
	name = "tree",
	opts = {
		ui = {
			confirm = {
				default_yes = true,
			},
		},
	},
}

-- Keymaps
-- local api = require 'nvim-tree.api'
-- vim.keymap.set('n', '<leader>tf', api.tree.focus)
-- vim.keymap.set('n', '<leader>tt', api.tree.toggle)
