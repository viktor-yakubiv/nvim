local packer = require('plugins.packer')

packer.startup(function (use)
  use 'gpanders/editorconfig.nvim'

  -- interface
  use 'nvim-lualine/lualine.nvim'
  use 'jeffkreeftmeijer/vim-dim'
end)
