local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap space as leader key
-- It is more handy on normal keyboards;
-- the default "\" appears in different places on EU and US layouts
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lsp = vim.lsp.buf
local diagnostic = vim.diagnostic

keymap("n", "gD", lsp.declaration, opts)
keymap("n", "gd", lsp.definition, opts)
keymap("n", "K", lsp.hover, opts)
keymap("n", "gI", lsp.implementation, opts)
keymap("n", "gr", lsp.references, opts)
keymap("n", "gl", diagnostic.open_float, opts)

keymap("n", "<leader>lf", lsp.format, opts)
keymap("n", "<leader>la", lsp.code_action, opts)
keymap("n", "<leader>lj", diagnostic.goto_next, opts)
keymap("n", "<leader>lk", diagnostic.goto_prev, opts)
keymap("n", "<leader>lr", lsp.rename, opts)
keymap("n", "<leader>ls", lsp.signature_help, opts)
keymap("n", "<leader>lq", diagnostic.setloclist, opts)

-- Navigayion by pages with screen centered
-- Thanks to @ThePrimagen for sharing this nice hack
keymap("n", "<C-f>", "<C-f>z.", opts)
keymap("n", "<C-d>", "<C-d>z.", opts)
keymap("n", "<C-b>", "<C-b>z.", opts)
keymap("n", "<C-u>", "<C-u>z.", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("v", "p", '"_dP', opts) -- discard replaced text

local telescope_loaded, telescope = pcall(require, 'telescope')
if telescope_loaded then
	local builtin = require 'telescope.builtin'
	keymap('n', '<leader><leader>', builtin.resume)
	keymap('n', '<leader>ff', builtin.find_files)
	keymap('n', '<leader>gf', builtin.git_files)
	keymap('n', '<leader>fg', builtin.live_grep)
	keymap('n', '<leader>fb', builtin.buffers)
	keymap('n', '<leader>fh', builtin.help_tags)
	if telescope.extensions.gitmoji then
		keymap('n', '<leader>ge', telescope.extensions.gitmoji.gitmoji)
	end
end

local treesj_loaded, treesj = pcall(require, 'treesj')
if treesj_loaded then
	keymap("n", "<leader>m", treesj.toggle, opts)
end

local oil_loaded, oil = pcall(require, "oil")
if oil_loaded then
	keymap("n", "-", oil.open)

	local function oil_cwd() oil.open(vim.fn.getcwd()) end
	keymap("n", "<leader>-", oil_cwd)
end
