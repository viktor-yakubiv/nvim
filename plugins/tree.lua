local tree = require 'nvim-tree'
local api = require 'nvim-tree.api'

tree.setup()

-- Keymaps
vim.keymap.set('n', '<leader>tf', api.tree.focus)
vim.keymap.set('n', '<leader>tt', api.tree.toggle)
