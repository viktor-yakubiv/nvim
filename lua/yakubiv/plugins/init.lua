local lazy = require 'yakubiv.plugins.lazy'

-- prefix for the require() call with plugin configurations
local package_prefix = "yakubiv.plugins."

local plugin_list = {}
local plugin_map = {}


-- Other files in the ./plugins directory are plugin definitions
local excluded_files = {
	"init.lua",  -- current file
	"lazy.lua", -- package manager configuration
	"packer.lua", -- another package manager
}

local get_name = require("lazy.core.plugin").Spec.get_name
local function get_pretty_name(pkg)
	local name = get_name(pkg)
	name = name:sub(-4) == "nvim" and name:sub(1, -6) or name
	name = name:sub(1, 4) == "nvim" and name:sub(6) or name
	return name:gsub("_", "-")
end

local function normalize(spec)
	local plugins = {}

	if type(spec) == "string" then
		plugins[#plugins + 1] = { spec, name = get_pretty_name(spec) }
	elseif type(spec[1]) == "string" and not vim.tbl_islist(spec) then
		if spec.dependencies ~= nil then
			spec.dependencies = normalize(spec.dependencies)
		end
		spec.name = spec.name or get_pretty_name(spec[1])
		plugins[#plugins + 1] = spec
	else
		for _, subspec in ipairs(spec) do
			for _, plugin in ipairs(normalize(subspec)) do
				plugins[#plugins + 1] = plugin
			end
		end
	end

	return plugins
end

local function scan_files()
	local current_file_path = debug.getinfo(2, "S").source
	local current_dir = vim.fn.fnamemodify(current_file_path, ":h"):sub(2)

	-- adopted from plenary.nvim
	local files = {}
	local uv = vim.loop
	local fd = uv.fs_scandir(current_dir)
	if fd then
		while true do
			local name = uv.fs_scandir_next(fd)
			if name == nil then
				break
			end

			if name:sub(-4) == ".lua" then
				files[#files + 1] = name
			end
		end
	end

	return files
end

local function filter_files(files, exclude_list)
	local filtered_files = {}

	for _, file_name in ipairs(files) do
		local filtered_out = false

		for _, excluded_file_name in ipairs(exclude_list) do
			if file_name == excluded_file_name then
				filtered_out = true
				break
			end
		end

		if not filtered_out then
			filtered_files[#filtered_files + 1] = file_name
		end
	end

	return filtered_files
end

local function load_configs(files)
	local plugin_names = {}
	for index, file_name in ipairs(files) do
		plugin_names[index] = package_prefix .. string.gsub(file_name, "%.lua$", "")
	end

	local loaded_configs = {}
	for _, module_name in ipairs(plugin_names) do
		local config = require(module_name)
		loaded_configs[#loaded_configs + 1] = config
	end

	return loaded_configs
end

local function extend(spec, extension)
	local extended = vim.tbl_deep_extend("force", spec, extension)
	for key, value in pairs(extended) do
		spec[key] = value
	end
end

local function attach_methods(plugin)
	plugin.extend = extend
	plugin.setup = function (opts)
		plugin.opts = vim.tbl_deep_extend("force", plugin.opts or {}, opts)
	end
end

local function add(spec, level)
	spec.name = spec.name or get_pretty_name(spec[1])
	local key = spec.name:gsub("%W+", "_")
	plugin_map[key] = vim.tbl_deep_extend("force", plugin_map[key] or {}, spec)

	attach_methods(plugin_map[key])

	local replaced = false
	for index, plugin in ipairs(plugin_list) do
		if plugin[1] == spec[1] then
			plugin_list[index] = plugin_map[key]
			replaced = true
			break
		end
	end

	if not replaced and not level then
		plugin_list[#plugin_list+1] = plugin_map[key]
	end

	for _, dep in ipairs(plugin_map[key].dependencies or {}) do
		add(dep, (level or 0) + 1)
	end
end

local function autoload()
	local plugin_files = filter_files(scan_files(), excluded_files)
	local plugin_list = normalize(load_configs(plugin_files))
	for _, plugin in ipairs(plugin_list) do
		add(plugin)
	end
end

local function complete_setup()
	-- all defined plugins are loaded
	lazy.setup(plugin_list)
end

local M = setmetatable({}, {
	__index = function(_, k)
		return plugin_map[k]
	end,
})

M.autoload = autoload

M.load = complete_setup
M.use = function (spec)
	local list = normalize(spec)
	for _, plugin in ipairs(list) do
		add(plugin)
	end
end

return M
