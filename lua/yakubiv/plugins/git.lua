return {
	-- Indicate line changes next to the number
	{
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		opts = {},
	},

	{
		"sindrets/diffview.nvim",
		config = true,
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim",
		},
		cmd = "Neogit",
		disabled = true,
	},
}
