local plugins = require "yakubiv.plugins"

local configs = {} -- full confugurations for language servers

local function prepare_config(preconfig)
	local config = preconfig or {}

	--- Capabilities
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local cmp_installed, cmp_lsp = pcall(require, "cmp_nvim_lsp")
	if cmp_installed then
		capabilities = cmp_lsp.default_capabilities(capabilities)
	end

	if config.capabilities == nil then
		config.capabilities = capabilities
	end

	return config
end

local function auto_setup(server_name)
	local lspconfig = require "lspconfig"
	lspconfig[server_name].setup(configs[server_name] or prepare_config())
end

local function extend_config(config, extension)
	local extended = vim.tbl_deep_extend("force", config, extension)
	for key, value in pairs(extended) do
		config[key] = value
	end
end

local function attach_methods(config)
	config.extend = extend_config
	config.setup = function(opts)
		config:extend { settings = opts }
	end
end

plugins.mason_lspconfig.setup {
	ensure_installed = {},
	handlers = { auto_setup },
}

--- Smart module enabling setup of language servers from multiple files
local M = setmetatable({}, {
	__index = function(_, k)
		if configs[k] == nil then
			configs[k] = prepare_config()
			attach_methods(configs[k])
		end

		return configs[k]
	end,
})

M.ensure_installed = function(servers)
	if plugins.mason_lspconfig.opts.ensure_installed == nil then
		plugins.mason_lspconfig.setup { ensure_installed = {} }
	end

	local ensure_list = plugins.mason_lspconfig.opts.ensure_installed
	for _, server in ipairs(servers) do
		ensure_list[#ensure_list + 1] = server
	end
end

M.prepare_config = prepare_config

M.override_handler = function(server_name, fn)
	local handlers = {}
	handlers[server_name] = fn
	plugins.mason_lspconfig.setup { handlers = handlers }
end

return M
