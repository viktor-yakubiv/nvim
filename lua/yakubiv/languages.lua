local plugins = require "yakubiv.plugins"

local settings ={
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

plugins.mason_lspconfig.setup {
	ensure_installed = {},
	automatic_installatin = false,
}

plugins.lspconfig.config = function ()
	local lspconfig = require "lspconfig"

	--- Capabilities
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local cmp_installed, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
	if cmp_installed then
		capabilities = cmp_lsp.default_capabilities(capabilities)
	end

	local mason_installed, mason = pcall(require, 'mason-lspconfig')
	if not mason_installed then
		return
	end

	--- Language servers setup
	local installed_server_names = mason.get_installed_servers()
	for _, server_name in pairs(installed_server_names) do
		local opts = {
			capabilities = settings.capabilities or capabilities,
			settings = {},
		}

		if settings[server_name] then
			opts.settings[server_name] = settings[server_name]
		end

		lspconfig[server_name].setup(opts)
	end
end
