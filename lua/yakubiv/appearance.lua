local theme_installed, catppuccin = pcall(require, 'catppuccin')
if not theme_installed then
	return
end

catppuccin.setup {
	-- If GUI (Neovide), set the background
	-- or rely on terminal background otherwice (which uses the same theme)
	transparent_background = not vim.g.neovide,
}

-- vim.cmd.colorscheme 'stim' -- my scheme based on Sublime Text's Mariana
vim.cmd.colorscheme 'catppuccin'
