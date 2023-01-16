local packer = require('plugins.packer')

packer.startup(function (use)
  use 'gpanders/editorconfig.nvim'

  -- completion
  use 'hrsh7th/nvim-cmp'
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' } -- buffer completions
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' } -- path completions
  use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' } -- snippet completions
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-emoji', after = 'nvim-cmp' }

  -- snippets
  use 'L3MON4D3/LuaSnip' --snippet engine
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

  -- LSP
  use 'neovim/nvim-lspconfig' -- enable LSP
  use 'williamboman/mason.nvim' -- language server manager
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

  -- interface
  use 'nvim-lualine/lualine.nvim'
  use 'jeffkreeftmeijer/vim-dim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use { 'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate' }
end)
