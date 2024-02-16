local function keymap(conf)
	local lhs, rhs = unpack(conf)
	local mode = conf.mode or "n"

	local opts = { noremap = true, silent = true }
	for key, value in pairs(conf) do
		if type(key) == "string" and key ~= "mode" then
			opts[key] = value
		end
	end

	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Remap space as leader key
-- It is more handy on normal keyboards;
-- the default "\" appears in different places on EU and US layouts
keymap { "<Space>", "<Nop>", mode = "" }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lsp = vim.lsp.buf
local diagnostic = vim.diagnostic

-- Removing default help opening by F1,
-- it is very annoying when hit accidentally targeting Esc
keymap { "<F1>", "<Nop>", mode = "" }

keymap { "<D>", "i" }
-- keymap("v", "<D-c>", "y", opts)

keymap { "gD", lsp.declaration }
keymap { "gd", lsp.definition }
keymap { "K", lsp.hover }
keymap { "gI", lsp.implementation }
keymap { "gr", lsp.references }
keymap { "gl", diagnostic.open_float }

keymap { "<leader>lf", lsp.format }
keymap { "<leader>la", lsp.code_action }
keymap { "<leader>lj", diagnostic.goto_next }
keymap { "<leader>lk", diagnostic.goto_prev }
keymap { "<leader>lr", lsp.rename }
keymap { "<leader>ls", lsp.signature_help }
keymap { "<leader>lq", diagnostic.setloclist }

-- Navigayion by pages with screen centered
-- Thanks to @ThePrimagen for sharing this nice hack
keymap { "<C-f>", "<C-f>z." }
keymap { "<C-d>", "<C-d>z." }
keymap { "<C-b>", "<C-b>z." }
keymap { "<C-u>", "<C-u>z." }

-- Better window navigation
keymap { "<C-h>", "<C-w>h" }
keymap { "<C-j>", "<C-w>j" }
keymap { "<C-k>", "<C-w>k" }
keymap { "<C-l>", "<C-w>l" }

-- Navigate buffers
keymap { "<S-l>", ":bnext<CR>" }
keymap { "<S-h>", ":bprevious<CR>" }

keymap { mode = "v", "p", '"_dP' } -- discard replaced text

local telescope_loaded, telescope = pcall(require, 'yakubiv.plugins.telescope')
if telescope_loaded then
	local builtin = require 'telescope.builtin'
	telescope.keys = {
		{ '<leader><leader>', builtin.resume, desc = "Resume previous search" },
		{ '<leader>ff', builtin.find_files, desc = "Find files" },
		{ '<leader>gf', builtin.git_files, desc = "Git files" },
		{ '<leader>fg', builtin.live_grep, desc = "Live grep" },
		{ '<leader>fb', builtin.buffers, desc = "Buffers" },
		{ '<leader>fh', builtin.help_tags, desc = "Help tags" },
		{
			'<leader>ge',
			function () require('telescope').extensions.gitmoji.gitmoji() end,
			desc = "Gitmoji",
		}
	}
	-- if telescope.extensions.gitmoji then
	-- 	keymap('n', '<leader>ge', telescope.extensions.gitmoji.gitmoji)
	-- end
end

local treesj_loaded, treesj = pcall(require, 'treesj')
if treesj_loaded then
	keymap { "<leader>m", treesj.toggle }
end

local oil_loaded, oil = pcall(require, "oil")
if oil_loaded then
	keymap { "-", oil.open }

	local function oil_cwd() oil.open(vim.fn.getcwd()) end
	keymap { "<leader>-", oil_cwd }
end