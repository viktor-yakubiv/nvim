local plugins = require "yakubiv.plugins"

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

-- plugin is lazy loaded even if a file within is loaded
local telescope = require 'telescope.builtin'
plugins.telescope.keys = {
	{ '<leader><leader>', telescope.resume, desc = "Resume previous search" },
	{ '<leader>ff', telescope.find_files, desc = "Find files" },
	{ '<leader>gf', telescope.git_files, desc = "Git files" },
	{ '<leader>fg', telescope.live_grep, desc = "Live grep" },
	{ '<leader>fb', telescope.buffers, desc = "Buffers" },
	{ '<leader>fh', telescope.help_tags, desc = "Help tags" },
	{
		'<leader>ge',
		function () require('telescope').extensions.gitmoji.gitmoji() end,
		desc = "Gitmoji",
	}
}

plugins.oil.keys = {
	{ "-", "<cmd>Oil<cr>" },
	{ "<leader>-", function() require("oil").open(vim.fn.getcwd()) end },
}

plugins.treesj.keys = {
	{ "<localleader>m", function() require("treesj").toggle() end, desc = "Toggle split/join" }
}

plugins.neotree.keys = {
	{ "\\",  "<cmd>Neotree focus<cr>" },
	{ "\\r", "<cmd>Neotree reveal<cr>" },
	{ "\\g", "<cmd>Neotree git_status<cr>" },
	{ "\\b", "<cmd>Neotree buffers<cr>" },
} and {} -- effectively disabling keys

plugins.tree.keys = {
	{ "\\",  "<cmd>NvimTreeOpen<cr>" },
	{ "\\r", "<cmd>NvimTreeFindFile<cr>" },
}

plugins.neogit.keys = {
	{
		"<leader>gs",
		function() require("neogit").open() end,
		desc = "Git status",
	},
}

plugins.gitsigns.setup {
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function navigator(keystroke, action)
			return function()
				if vim.wo.diff then return keystroke end
				vim.schedule(function() action() end)
				return '<Ignore>'
			end
		end

		local maps = {
			-- Navigation
			{ "]c", navigator("]c", gs.next_hunk), expr = true, desc = "Next hunk" },
			{ "[c", navigator("[c", gs.prev_hunk), expr = true, desc = "Previous hunk" },

			-- Actions
			{ "<localleader>hs", gs.stage_hunk, desc = "Stage hunk" },
			{ "<localleader>hr", gs.reset_hunk, desc = "Reset hunk" },
			{ "<localleader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, mode = "v", desc = "Stage hunk" },
			{ "<localleader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, mode = "v", desc = "Reset hunk" },
			{ "<localleader>hS", gs.stage_buffer, desc = "Stage buffer" },
			{ "<localleader>hu", gs.undo_stage_hunk, desc = "Undo hunk staging" },
			{ "<localleader>hR", gs.reset_buffer, desc = "Reset buffer" },
			{ "<localleader>hp", gs.preview_hunk, desc = "Preview hunk" },
			{ "<localleader>hb", function() gs.blame_line { full = true } end, desc = "Blame line" },
			{ "<localleader>tb", gs.toggle_current_line_blame, desc = "Toggle current line blame" },
			{ "<localleader>hd", gs.diffthis, desc = "Diff this" },
			{ "<localleader>hD", function() gs.diffthis("~") end, desc = "Diff ~" },
			{ "<localleader>td", gs.toggle_deleted, desc = "Toggle deleted hunks" },

			-- Text object
			{ "ih", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" }, desc = "inner hunk" },
		}

		for _, map in ipairs(maps) do
			keymap(vim.tbl_extend("force", { buffer = bufnr }, map))
		end
	end
}
