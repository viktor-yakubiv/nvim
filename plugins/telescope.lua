local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup {
	defaults = {
		mappings = {
			i = {
				['<esc>'] = actions.close,
			},
		},
	},

	pickers = {
		find_files = {
			find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
		},

		symbols = {
			sources = { 'emoji', 'gitmoji' },
		},
	},

	extensions = {
		gitmoji = {
			action = function(entry)
				local emoji = entry.value.value

				if vim.bo.filetype == 'gitcommit' then
					vim.api.nvim_put({ emoji }, "c", true, true)
					return
				end

				vim.ui.input({ prompt = "Enter commit message: " .. emoji .. " " }, function(msg)
						if not msg then
							return
						end

						local git_tool = ":!git"
						if vim.g.loaded_fugitive then
							git_tool = ":G"
						end

						vim.cmd(string.format('%s commit -m "%s %s"', git_tool, msg, emoji))
				end)
			end,
		},
	},
}

telescope.load_extension('gitmoji')
