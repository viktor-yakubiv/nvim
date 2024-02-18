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
		opts = {},
		enabled = false,
	},
}
