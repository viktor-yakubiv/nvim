local plugins = require "yakubiv.plugins"

plugins.copilot.setup {
	copilot_enabled = false,
}

plugins.codecompanion.setup {
	strategies = {
		chat = {
			adapter = "copilot",

			roles = {
				llm = function(adapter)
					return adapter.formatted_name
				end,
				user = "Viktor Yakubiv",
			},

			opts = {
				completion_provider = "cmp",
			},
		},

		inline = {
			adapter = "copilot",
		},

		cmd = {
			adapter = "copilot",
		},
	},
}

plugins.render_markdown:extend {
	ft = { "markdown", "codecompanion" },
	opts = {
		file_types = { "markdown", "codecompanion" },
	},
}
