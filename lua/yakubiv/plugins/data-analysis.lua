return {
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = true,
		cmd = {
			"QuartoPreview",
			"QuartoClosePreview",
			"QuartoHelp",
			"QuartoActivate",
			"QuartoDiagnostics",
			"QuartoSend",
			"QuartoSendAbove",
			"QuartoSendBelow",
			"QuartoSendAll",
			"QuartoSendLine",
		},
	},

	-- LSP inside Markdown
	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = true,
		lazy = true,
	},

	-- Interactive REPLs over Neovim
	{
		"Vigemus/iron.nvim",
		config = true,
		lazy = true,
		cmd = {
			"IronRepl",
			"IronReplHere ",
			"IronRestart",
			"IronSend",
			"IronFocus ",
			"IronHide ",
			"IronWatch",
			"IronAttach",
		},
	},
}
