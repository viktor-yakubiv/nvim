local packer = require('plugins.packer')

packer.startup(function (use)
  use 'gpanders/editorconfig.nvim'

  use 'jeffkreeftmeijer/vim-dim'
end)
