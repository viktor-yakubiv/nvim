return {
	'olacin/telescope-gitmoji.nvim',
	dependencies = { 'nvim-telescope/telescope.nvim' },
	cmd = "Telescope gitmoji",

	opts = {
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

	config = function(self, opts)
		local telescope = require 'telescope'
		telescope.setup { extensions = { gitmoji = opts } }
		telescope.load_extension('gitmoji')
	end,
}
