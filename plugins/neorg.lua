local neorg = require 'neorg'

neorg.setup {
	load = {
		-- Loads default behaviour
		["core.defaults"] = {},

		["core.keybinds"] = {
			config = {
				hook = function (keybinds)
					keybinds.remap_key("norg", "n", "C-Space", "M-Space")
				end,
			},
		},

		-- Adds pretty icons to documents
		["core.concealer"] = {
			config = {
				icon_preset = "diamond",
				icons = {
					todo = {
						undone = { icon = " " },
					},
				},
			},
		},

		-- Manages Neorg workspaces
		-- 	["core.dirman"] = {
		-- 		config = {},
		-- 	},

		["core.completion"] = { -- does not work 🤔
			config = {
				engine = 'nvim-cmp',
				name = 'norg',
			},
		},
	},
}
