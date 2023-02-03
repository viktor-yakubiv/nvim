--- This script installs packer.nvim – a package manager
--- if it was not installed yet and returns it.

-- Plugins could be under `/start` – loaded within the startup
-- or `/opt` – loaded upon user request with `packadd ...`
-- Both are stored within the following path.
local plugin_path = vim.fn.stdpath('data') .. '/site/pack/packer'

-- Packer is a plugin, therefore installed into the plugin directory.
local packer_severity = '/start'
local packer_path = plugin_path .. packer_severity .. '/packer.nvim'

-- When packer synchoronizes module, it creates a compiled lua module
local bundle_path = vim.fn.stdpath('data') .. '/site/lua/packer_bundle.lua'
local bundle_name = 'packer_bundle'
local snapshot_path = vim.fn.stdpath('data') .. '/snapshots'

-- we consider three situations here:
-- 0: this is a fresh system/nvim installation and we need to install packer
-- 1: we have just installed packer within this script
-- *: packer was installed and plugins bundle was compiled
local packer_loaded, packer = pcall(require, 'packer')
local packer_freshly_installed = false
local update_period = 7 * 24 * 60 * 60 -- a week in seconds

if not packer_loaded then
  print('Cloning packer...')
  -- remove the dir before cloning
  vim.fn.delete(packer_path, 'rf')
  vim.fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    '--depth',
    '20',
    packer_path,
  })

  vim.cmd('packadd packer.nvim')
  packer_loaded, packer = pcall(require, 'packer')

  if packer_loaded then
    print('Packer cloned successfully.')
    packer_freshly_installed = true
  else
    error("Couldn't clone packer !\nPacker path: " .. packer_path .. '\n' .. packer)
  end
end

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
    prompt_border = 'rounded',
  },
  git = {
    clone_timeout = 800, -- Timeout, in seconds, for git clones
  },
  compile_path = bundle_path, 
  snapshot_path = snapshot_path,
  auto_clean = true,
  compile_on_sync = true,
})

function packer.complete()
	local sync_required = packer_freshly_installed

	-- checks if any file in the plugins config is modified after the bundle
	-- when `$ find ...` throws (the bundle does not exist), results to true
	if not sync_required and packer.auto_sync then
		local plugins_config_dir = vim.fn.stdpath('config') .. '/plugins'
		local find_cmd = 'find "' .. plugins_config_dir .. '" -newer "' .. bundle_path .. '"'
		local fresh_configs_added = vim.fn.system(find_cmd) ~= ''
		sync_required = fresh_configs_added
	end

	-- checks if bundle was created before our update period
	if not sync_required and packer.auto_sync then
		local current_timestamp = os.time(os.date("!*t"))
		local bundle_timestamp = tonumber(vim.fn.system('date -r "' .. bundle_path .. '" +%s'))
		local stale = current_timestamp - bundle_timestamp > update_period
		sync_required = stale
	end

	if sync_required then
		packer.sync()
	else
		-- import compiled plugins
		ok, _ = pcall(require, bundle_name)
		if not ok then
			-- this should never happen due to the logic above
			-- leaving this piece of code for the sake of completeness
			local msg = 'Plugin bundle not found. Run :PackerSync to fix'
			vim.notify(msg, vim.log.levels.ERROR, { title = 'plugins.packer' })
		end
	end
end

local packer_startup = packer.startup
local function startup(startup_fn)
  return packer_startup(function (use)
    -- impatient.nvim speeds up loading other lua plugins
    -- it is recommended to put it before any other plugins
    use { 'lewis6991/impatient.nvim', config = [[require('impatient')]] }

    -- packer manages itself as well
    use { 'wbthomason/packer.nvim', opt = packer_severity == '/opt' }

    -- call user startup
    startup_fn(use)
  end)
end
packer.startup = startup

return packer 
