return {
	-- Enable language servers
	{ "neovim/nvim-lspconfig" },

	-- Language servers package manager
	{ "williamboman/mason.nvim", opts = {} },

	-- Wiring between nvim-lspconfig and Mason
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {},
	},
}
