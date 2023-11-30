local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local actions = require 'telescope.actions'
local config = require 'telescope.config'

local function project_files(opts)
	vim.fn.system('git rev-parse --is-inside-work-tree')
	if vim.v.shell_error == 0 then
		builtin.git_files(opts)
	else
		builtin.find_files(opts)
	end
end

telescope.setup {
	defaults = {
		mappings = {
			i = {
				['<esc>'] = actions.close,
			},
		},

		vimgrep_arguments = {
			unpack(config.values.vimgrep_arguments), -- use defaults

			'--hidden', -- enable search in hidden files
			'--glob', '!**/.git/*', -- but not in git files
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

-- Keymaps
vim.keymap.set('n', '<leader><leader>', project_files)
vim.keymap.set('n', '<leader>pf', project_files)
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>ge', telescope.extensions.gitmoji.gitmoji)
