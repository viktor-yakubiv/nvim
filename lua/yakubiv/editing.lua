local plugins = require "yakubiv.plugins"

-- Treet .org files as .norg to cheat with GitHub and Orgzly
vim.filetype.add { extension = { org = "norg" } }
vim.api.nvim_create_autocmd("FileType", {
	pattern = "norg",
	callback = function()
		vim.wo.conceallevel = 2 -- hide redundant characters
		vim.bo.expandtab = true -- Indent using spaces

	end
})


plugins.oil.setup {
	skip_confirm_for_simple_edits = true,
}
