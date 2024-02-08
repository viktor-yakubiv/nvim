local tree = require 'nvim-tree'
local api = require 'nvim-tree.api'

tree.setup {
	-- Netrw is a standard file explorer in Neovim.
	-- Despite it has other features, I have not used them,
	-- so disabling this according to the recommendation in the docs.
	disable_netrw = true,
}

-- Keymaps
vim.keymap.set('n', '<leader>tf', api.tree.focus)
vim.keymap.set('n', '<leader>tt', api.tree.toggle)
