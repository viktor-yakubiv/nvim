local plugins = require "yakubiv.plugins"

plugins.codecompanion.setup {
	adapters = {
		codellama = function()
			return require("codecompanion.adapters").extend("ollama", {
				name = "codellama",
				schema = {
					model = {
						default = "codellama:latest",
					},
				},
			})
		end,
	},

	strategies = {
		chat = {
			adapter = "codellama",
		},
		inline = {
			adapter = "codellama",
		},
		cmd = {
			adapter = "codellama",
		},
	},
}
