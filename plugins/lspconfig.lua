local mason = require 'mason'
local mason_lspconfig = require 'mason-lspconfig'
local lspconfig = require 'lspconfig'

--- Uset settings
local settings = require 'settings.lsp'

--- Mason (the language servers package manager) config
mason.setup()
mason_lspconfig.setup {
	ensure_installed = settings.required_servers,
	automatic_installation = settings.automatic_installation or false,
}

--- Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local cmp_installed, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_installed then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

--- Language servers setup
local installed_server_names = mason_lspconfig.get_installed_servers()
for _, server_name in pairs(installed_server_names) do
	local opts = { capabilities = settings.capabilities or capabilities }

	if settings.servers[server_name] then
		opts = vim.tbl_deep_extend('force', settings.servers[server_name], opts)
	end

	lspconfig[server_name].setup(opts)
end

