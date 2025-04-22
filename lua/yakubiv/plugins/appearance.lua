return {
	-- Catppuccin is my primary color scheme currently.
	-- Previously, I have used (in chronological order):
	-- * Monokai Pro
	-- * Mariana and Brackets, standard dark and light schemes of Sublime Text 4
	-- * Stim — my own color scheme, Mariana ported to terminal colours
	{ 'catppuccin/nvim', name = 'catppuccin', opts = {} },

	-- Automatic system appearance detection
	-- For some reason Neovim does not pick it properly from the terminal
	{ 'f-person/auto-dark-mode.nvim', opts = {}, lazy = false },

	-- Better status line
	{ 'nvim-lualine/lualine.nvim', opts = {}, lazy = false },

	-- Indicate line changes next to the number
	{
		'lewis6991/gitsigns.nvim',
		event = "BufEnter",
		opts = {},
	},

	-- File icons that many plugins use, e.g. nvim-tree.lua, neo-tree, telescope
	{ 'nvim-tree/nvim-web-devicons', opts = {}, lazy = true },

	{
		"folke/noice.nvim",

		-- looks like noice references itself, so the name cannot be shortened
		name = "noice.nvim",

		dependencies = {
			{ "MunifTanjim/nui.nvim" },
			{ "rcarriga/nvim-notify" },
		},
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering
				-- so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			cmdline = {
				view = "cmdline",
			},
			messages = {
				view = "mini",
			},
			presets = {
				bottom_search = true,
				command_palette = false,
				long_message_to_split = true,
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},

		config = function (plugin, opts)
			require("noice").setup(opts)

			require("notify").setup {
				-- This colour is used to detect background lightness.
				-- In terminal, I use transparent background
				-- relying on the terminal's UI.
				-- Ideally, this could track the theme's background from Catppuccin
				-- based on the current vim.opt.background
				-- but for the sake of simplicity I don't care —
				-- I need to remove annoying message
				background_colour = "#000000"
			}
		end,
	},

	-- Nice rendering of Markdown
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},

		ft = {
			"markdown",
		},

		opts = {},
	},
}
