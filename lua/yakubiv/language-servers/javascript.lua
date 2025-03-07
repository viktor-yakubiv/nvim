local lsp = require "yakubiv.language-servers"

lsp.ensure_installed {
	"ts_ls",
	"volar", -- I work with Vue currently
}

local function setup_vue_ts()
	local preconfig = lsp.prepare_config()

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

	lspconfig.ts_ls.setup(config)
end

lsp.override_handler("ts_ls", setup_vue_ts)
