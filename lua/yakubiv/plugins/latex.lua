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
}
