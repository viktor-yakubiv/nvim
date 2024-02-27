local plugins = require "yakubiv.plugins"

-- Treet .org files as .norg to cheat with GitHub and Orgzly
vim.filetype.add { extension = { org = "norg" } }


plugins.oil.setup {
	skip_confirm_for_simple_edits = true,
}
