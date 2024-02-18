local plugins = require "yakubiv.plugins"

-- Oil is my tree editor and a browser therefore
plugins.oil:extend {
	lazy = false,
	opts = { default_file_explorer = true },
}

plugins.tree.setup {
	-- Tree is a secondary browser
	hijack_netrw = false,
	view = {
		float = {
			enable = true,
		},
	},
}
