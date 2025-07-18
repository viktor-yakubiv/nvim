local options = {
	autoread = true, -- automatically reload files
	autowrite = true, -- no need to save on buffer change
	autowriteall = true, -- no need to save on quit
	backup = false, -- no backup files, causes watchers detect two changes

	-- Prefer tabs, 2-space long
	expandtab = false,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,

	splitright = true,

	-- Smart search
	ignorecase = true, -- case insesitive search
	smartcase = true, -- unless upper case used
	magic = true, -- RegExp special chars don't require escaping

	-- Minimum lines to keep above and below cursor when scrolling
	scrolloff = 3,

	-- Text up to 80 characters long
	colorcolumn = { 80, 100, 120 },
	textwidth = 80, -- automatically add hard text wraps at 80th coolumn
	wrap = false, -- easier to navigate

	-- Show hidden characters
	list = true,
	listchars = "tab:→ ,trail:~,eol:¬,extends:❯,precedes:❮,nbsp:␣",

	-- Persistent undo even after you close a file and re-open it
	undofile = true,

	clipboard = "unnamedplus", -- copy to system clipboard
}

for name, value in pairs(options) do
	vim.opt[name] = value
end

-- Ignore certain files and folders when globing
vim.opt.wildignore:append {
	-- system caches
	"*.DS_Store",

	-- compiled files
	"*.o",
	"*.obj",
	"*.dylib",
	"*.bin",
	"*.dll",
	"*.exe",

	-- cache and version control
	"*/.git/*",
	"*/__pycache__/*",

	-- non-tex files, binaries
	"*.jpg",
	"*.png",
	"*.jpeg",
	"*.bmp",
	"*.gif",
	"*.tiff",
	"*.ico",
}

vim.opt.wildignorecase = true -- ignore file and dir name cases in cmd-completion

-- Lang mapping does not work with key bindings
--
-- Related issues:
-- https://github.com/neovim/neovim/issues/27776
-- https://github.com/vim/vim/issues/297
local specials = { ";", ",", '"', "|", "\\" }
local function escape(char)
	if vim.tbl_contains(specials, char) then
		return "\\" .. char
	end
	return char
end

local keymap = require "yakubiv.ukrainian-jcukenmac"
local langmap = {}
for target_char, source_char in pairs(keymap) do
	langmap[#langmap + 1] = escape(source_char) .. escape(target_char)
end

vim.opt.langmap = langmap
vim.opt.langremap = false
