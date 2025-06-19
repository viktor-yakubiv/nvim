return {
	{
		"nvim-telescope/telescope-bibtex.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		ft = { "tex", "bib" },
		config = function()
			local telescope = require "telescope"
			telescope.load_extension "bibtex"
		end,
	},

	{
		"jmbuhr/telescope-zotero.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"kkharji/sqlite.lua",
		},
		ft = { "tex", "bib" },
		config = function()
			local telescope = require "telescope"
			telescope.load_extension "zotero"
		end,
	},
}
