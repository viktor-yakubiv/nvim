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

    if packer_freshly_installed then
      -- sync packer when it is just installed
      packer.sync()
    else
      -- import compiled plugins
      ok, _ = pcall(require, bundle_name)
      if not ok then
	local msg = 'Plugin bundle not found. Run :PackerSync to fix'
	vim.notify(msg, vim.log.levels.ERROR, { title = 'plugins.packer' })
      end
    end
  end)
end
packer.startup = startup

return packer 
