local plugins = require "yakubiv.plugins"

plugins.quarto.setup {
	codeRunner = {
		default_method = "iron",
	},
}

plugins.iron.setup {}
