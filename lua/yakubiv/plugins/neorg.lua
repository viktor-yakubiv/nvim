return {
	"nvim-neorg/neorg",
	dependencies = {
		{ "vhyrro/luarocks.nvim", opts = {} },
		"hrsh7th/nvim-cmp",
	},
	ft = { "norg" },
	cmd = "Neorg",
	opts = {
		load = {
			-- Loads default behaviour
			["core.defaults"] = {},

			["core.keybinds"] = {
				config = {
					hook = function(keybinds)
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
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/Notes",
					},
				},
			},

			["core.completion"] = { -- does not work 🤔
				config = {
					engine = "nvim-cmp",
					name = "norg",
				},
			},

			["core.journal"] = {
				config = {
					strategy = "flat",
				},
			},

			["core.export"] = {
				config = {},
			},
		},
	},
}
