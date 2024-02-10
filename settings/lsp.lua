local M = {}

M.servers = {
	html = {
		autoCreateQuotes = false,
		-- completion.attributeDefaultValue = "doublequotes",
		format = {
			wrapLineLength = 80,
		},
	},

	emmet_ls = {
		filetypes = { 'html', 'css', 'sass', 'scss' },
	},

	ltex = {
		language = 'en-GB',
	},
}

return M
