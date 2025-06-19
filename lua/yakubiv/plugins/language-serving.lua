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

	{
		"lewis6991/hover.nvim",

		opts = {
			init = function()
				-- Require providers
				require "hover.providers.lsp"
				-- require('hover.providers.dap')
				require "hover.providers.diagnostic"
				require "hover.providers.dictionary"
				-- require('hover.providers.gh')
				-- require('hover.providers.gh_user')
				-- require('hover.providers.jira')
				require "hover.providers.man"
				-- require('hover.providers.fold_preview')
			end,
		},
	},
}
