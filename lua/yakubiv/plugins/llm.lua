return {
	{
		"github/copilot.vim",
		name = "copilot",
		event = "VeryLazy",
		config = function(plugin, opts)
			for key, value in pairs(opts) do
				vim.g[key] = value
			end
		end,
		opts = {},
	},

	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = true,
		cmd = {
			"CodeCompanion",
			"CodeCompanionActions",
			"CodeCompanionChat",
			"CodeCompanionCmd",
		},
	},
}
