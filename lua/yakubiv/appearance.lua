local plugins = require 'yakubiv.plugins'

-- Enabling line numbering
-- and making it relative for easier navigation
vim.opt.number = true
vim.opt.relativenumber = true

plugins.use {
	-- Automatic system appearance detection
	-- For some reason Neovim does not pick it properly from the terminal
	plugins.auto_dark_mode,

	-- Better status line
	plugins.lualine,

	-- Indicate line changes next to the number
	plugins.gitsigns,

	-- Catppuccin is my primary color scheme currently.
	-- Previously, I have used (in chronological order):
	-- * Monokai Pro
	-- * Mariana and Brackets, standard dark and light schemes of Sublime Text 4
	-- * Stim — my own color scheme, Mariana ported to terminal colours
	plugins.catppuccin,
}

-- Higher priority for Lualine to make the colorscheme apply to it too

plugins.catppuccin.lazy = false
plugins.catppuccin.priority = 1000
plugins.catppuccin.opts = {
	-- If GUI (Neovide), set the background
	-- or rely on terminal background otherwice (which uses the same theme)
	transparent_background = not vim.g.neovide,
}
plugins.catppuccin.init = function()
	vim.cmd.colorscheme 'catppuccin'
end
