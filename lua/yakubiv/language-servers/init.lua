local plugins = require "yakubiv.plugins"

local function setup_vue (preconfig)
	local lspconfig = require "lspconfig"
	local registry = require "mason-registry"
	local vue_typescript_plugin_location = registry
			.get_package('vue-language-server')
			:get_install_path()
			.. "/node_modules/@vue/language-server"
			.. "/node_modules/@vue/typescript-plugin"

	local config = vim.tbl_deep_extend("force", preconfig, {
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = vue_typescript_plugin_location,
					languages = { 'javascript', 'typescript', 'vue' },
				},
			},
		},
		filetypes = {
			'javascript',
			'javascriptreact',
			'javascript.jsx',
			'typescript',
			'typescriptreact',
			'typescript.tsx',
			'vue',
		},
	})

	lspconfig.tsserver.setup(config)
end

local settings = {
	html = {
		settings = {
			autoCreateQuotes = false,
			-- completion.attributeDefaultValue = "doublequotes",
			format = {
				wrapLineLength = 80,
			},
		},
	},

	ltex = {
		settings = {
			language = 'en-GB',
		},
	},

	tsserver = setup_vue,
}

plugins.mason_lspconfig.setup {
	ensure_installed = {},
	automatic_installation = false,
	-- handlers = {
	--	function (server_name)
	--		local lspconfig = require "lspconfig"
	--		lspconfig[server_name].setup {}
	--	end
	-- },
}

plugins.lspconfig.config = function()
	local lspconfig = require "lspconfig"

	--- Capabilities
	local default_capabilities = vim.lsp.protocol.make_client_capabilities()
	default_capabilities.textDocument.completion.completionItem.snippetSupport = true

	local cmp_installed, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
	if cmp_installed then
		default_capabilities = cmp_lsp.default_capabilities(default_capabilities)
	end

	local mason_installed, mason = pcall(require, 'mason-lspconfig')
	if not mason_installed then
		return
	end

	--- Language servers setup
	local installed_server_names = mason.get_installed_servers()
	for _, server_name in pairs(installed_server_names) do
		local config = settings[server_name] or {}

		if type(config) == "function" then
			config({ capabilities = default_capabilities })
		else
			if config.capabilities == nil then
				config.capabilities = default_capabilities
			end

			lspconfig[server_name].setup(config)
		end
	end
end
