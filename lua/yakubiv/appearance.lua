local plugins = require 'yakubiv.plugins'

-- Enabling line numbering
-- and making it relative for easier navigation
vim.opt.number = true
vim.opt.relativenumber = true

plugins.enable {
	-- Automatic system appearance detection
	-- For some reason Neovim does not pick it properly from the terminal
	"auto_dark_mode",

	-- Better status line
	"lualine",

	-- Indicate line changes next to the number
	"gitsigns",

	-- Catppuccin is my primary color scheme currently.
	-- Previously, I have used (in chronological order):
	-- * Monokai Pro
	-- * Mariana and Brackets, standard dark and light schemes of Sublime Text 4
	-- * Stim — my own color scheme, Mariana ported to terminal colours
	"catppuccin",
}

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

plugins.web_devicons.opts = {
	color_icons = false,
	default = true,
}

plugins.neogit.opts = {
	graph_style = "unicode",
	signs = {
		-- { CLOSED, OPENED }
		section = { "", "" },
		item = { "", "" },
	},
}
