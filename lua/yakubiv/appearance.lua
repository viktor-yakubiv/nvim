local plugins = require "yakubiv.plugins"

-- Enabling line numbering
-- and making it relative for easier navigation
vim.opt.number = true
vim.opt.relativenumber = true

-- Catppuccin is my primary color scheme
plugins.catppuccin:extend {
	lazy = false,
	priority = 1000,

	opts = {
		-- If GUI (Neovide), set the background
		-- or rely on terminal background otherwice (which uses the same theme)
		transparent_background = not vim.g.neovide,
	},

	init = function()
		vim.cmd.colorscheme "catppuccin"
	end,
}

plugins.web_devicons.setup {
	color_icons = false,
	default = true,
}

plugins.neogit.setup {
	graph_style = "unicode",
	signs = {
		-- { CLOSED, OPENED }
		section = { "", "" },
		item = { "", "" },
	},
}

plugins.telescope.setup {
	defaults = {
		prompt_prefix = " 󰍉  ",
		selection_caret = " ",
	},
}
