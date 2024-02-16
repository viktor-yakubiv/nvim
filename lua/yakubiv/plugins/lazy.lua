-- Package manager setup — Lazy in my case
local plugins_root = vim.fn.stdpath("data") .. "/lazy"
local lazypath = plugins_root .. "/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require "lazy"

local opts = {
	root = plugins_root,

	-- I don't use multiple computers at the moment,
	-- keeping lockfile outside of the repository
	lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",

	defaults = {
		lazy = true,
	},

	ui = {
		border = "single",
	},
}

local setup = lazy.setup
lazy.setup = function (spec)
	setup(spec, opts)
end

return lazy
