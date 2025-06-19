local lsp = require "yakubiv.language-servers"

lsp.ensure_installed {
	"html",
	"ltex",
	"emmet_ls",
}

lsp.html.setup {
	autoCreateQuotes = false,
	-- completion.attributeDefaultValue = "doublequotes",
	format = {
		wrapLineLength = 80,
	},
}

lsp.ltex.setup {
	language = "en-GB",
}
