require('catppuccin').setup({
	-- If GUI (Neovide), set the background
	-- or rely on terminal background otherwice (which uses the same theme)
	transparent_background = not vim.g.neovide,
})

vim.cmd.colorscheme 'catppuccin'
