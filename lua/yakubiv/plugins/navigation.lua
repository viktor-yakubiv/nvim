return {
	{
		'nvim-tree/nvim-tree.lua',
		name = "tree",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			ui = {
				confirm = {
					default_yes = true,
				},
			},
		},
		enabled = false,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		name = "neotree",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		opts = {
			filesystem = {
				hijack_netrw_behavior = "disabled", -- is not default file browser
				use_libuv_file_wathcer = true, -- should improve performance
				filtered_items = {
					never_show = { ".DS_Store" },
				},

				follow_current_file = {
					enabled = true,
				},
			},
			window = {
				mappings = {
					-- consistency with Nvim-tree — I've got used to it
					["<space>"] = nil,
					["<tab>"] = "toggle_node",
				},
			},
		},
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	}
}
