return {
	{
		"nvim-telescope/telescope-bibtex.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		ft = { "tex", "bib" },
		config = function()
			local telecope = require "telescope"
			telecope.load_extension "bibtex"
		end,
	},
	{
		"jmbuhr/telescope-zotero.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"kkharji/sqlite.lua",
		},
		config = function()
			local telescope = require "telescope"
			telescope.load_extension "zotero"
		end,
		ft = { "tex", "bib" },
	},
}
