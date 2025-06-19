--- Package manager setup — Lazy in my case
local plugins_root = vim.fn.stdpath "data" .. "/lazy"
local lazypath = plugins_root .. "/lazy"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

local lazy = require "lazy"

local opts = {
	root = plugins_root,

	-- I don't use multiple computers at the moment,
	-- keeping lockfile outside of the repository
	lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json",

	install = {
		colorscheme = { "catppuccin", "habamax" },
	},

	ui = {
		border = "single",
	},

	dev = {
		path = "~/Development",
		patterns = { "viktor-yakubiv" },
	},
}

--- Nice plugin naming
local function clean_name(name)
	name = name:sub(-4) == "nvim" and name:sub(1, -6) or name
	name = name:sub(1, 4) == "nvim" and name:sub(6) or name
	return name:gsub("_", "-")
end

local plugin_configs = require "yakubiv.plugins"

local lazy_fragments = require "lazy.core.fragments"
local add_fragment = lazy_fragments.add
lazy_fragments.add = function(fragments, plugin)
	local fragment = add_fragment(fragments, plugin)

	-- Nicer name
	fragment.name = clean_name(fragment.name)

	-- Load my distributed config into the plugin spec
	local key = fragment.name:gsub("-", "_")
	local external_config = plugin_configs[key] or {}
	fragment.spec = vim.tbl_deep_extend("force", fragment.spec, external_config)

	return fragment
end

return lazy
