local lazy = require 'yakubiv.plugins.lazy'

local plugins = {}

local function add(spec)
	-- Lazy automatically resolves and normalizes nested lists
	-- We simply combine everything
	table.insert(plugins, spec)
end

local function setup()
	lazy.setup(plugins)
end

local M = {}
M.plugins = plugins
M.use = add
M.setup = setup

return M
