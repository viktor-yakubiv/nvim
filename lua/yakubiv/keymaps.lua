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

local function bind(func, ...)
	local args = { ... }
	return function()
		func(unpack(args))
	end
end

local function bind_module(module_name)
	return function(func_name, ...)
		local args = { ... }
		return function ()
			local module = require(module_name)
			local func = module[func_name]
			func(unpack(args))
		end
	end
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
keymap { "<C-f>", "<C-f>zz" }
keymap { "<C-d>", "<C-d>zz" }
keymap { "<C-b>", "<C-b>zz" }
keymap { "<C-u>", "<C-u>zz" }

-- Better window navigation
keymap { "<C-h>", "<C-w>h" }
keymap { "<C-j>", "<C-w>j" }
keymap { "<C-k>", "<C-w>k" }
keymap { "<C-l>", "<C-w>l" }

-- Navigate buffers
keymap { "<S-l>", ":bnext<CR>" }
keymap { "<S-h>", ":bprevious<CR>" }

keymap { mode = "v", "p", '"_dP' } -- discard replaced text

-- UI commands
keymap { "<D-s>", "<cmd>write<cr>", mode = "" }
keymap { "<D-S-s>", "<cmd>writeall<cr>", mode = "" }
keymap { "<D-q>", "<cmd>quit<cr>", mode = "" }

plugins.telescope.keys = {
	{ "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Resume previous" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
	{ "<D-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
	{ "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Git files" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
	{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymaps" },
	{
		"<leader>/",
		function()
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
				previewer = false,
			})
		end,
		desc = "Fuzzily search in current buffer",
	},
	{
		"<leader>f/",
		function()
			require("telescope.builtin").live_grep {
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			}
		end,
		desc = "Live grep in Open Files",
	},
	{
		"<leader>fn",
		function()
			require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
		end,
		desc = "Find Neovim files",
	},
}

plugins.telescope_gitmoji.keys = {
	{ "<leader>ge", "<cmd>Telescope gitmoji<cr>", desc = "Gitmoji" },
}

plugins.oil.keys = {
	{ "-", "<cmd>Oil<cr>" },
	{
		"<leader>-",
		function()
			require("oil").open(vim.fn.getcwd())
		end,
	},
}

plugins.treesj.keys = {
	{
		"<localleader>m",
		function()
			require("treesj").toggle()
		end,
		desc = "Toggle split/join",
	},
}

plugins.neotree.keys = {
	{ "\\", "<cmd>Neotree focus<cr>" },
	{ "\\r", "<cmd>Neotree reveal<cr>" },
	{ "\\g", "<cmd>Neotree git_status<cr>" },
	{ "\\b", "<cmd>Neotree buffers<cr>" },
}

plugins.tree.keys = {
	{ "\\", "<cmd>NvimTreeOpen<cr>" },
	{ "\\r", "<cmd>NvimTreeFindFile<cr>" },
} and {} -- effectively disabling keys

plugins.neogit.keys = {
	{
		"<leader>gs",
		function()
			require("neogit").open()
		end,
		desc = "Git status",
	},
}

plugins.gitsigns.setup {
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function navigator(keystroke, action)
			return function()
				if vim.wo.diff then
					return keystroke
				end
				vim.schedule(function()
					action()
				end)
				return "<Ignore>"
			end
		end

		local maps = {
			-- Navigation
			{ "]c", navigator("]c", gs.next_hunk), expr = true, desc = "Next hunk" },
			{ "[c", navigator("[c", gs.prev_hunk), expr = true, desc = "Previous hunk" },

			-- Actions
			{ "<localleader>hs", gs.stage_hunk, desc = "Stage hunk" },
			{ "<localleader>hr", gs.reset_hunk, desc = "Reset hunk" },
			{
				"<localleader>hs",
				bind(gs.stage_hunk, {
					vim.fn.line ".",
					vim.fn.line "v",
				}),
				mode = "v",
				desc = "Stage hunk",
			},
			{
				"<localleader>hr",
				bind(gs.reset_hunk, {
					vim.fn.line ".",
					vim.fn.line "v",
				}),
				mode = "v",
				desc = "Reset hunk",
			},
			{ "<localleader>hS", gs.stage_buffer, desc = "Stage buffer" },
			{ "<localleader>hu", gs.undo_stage_hunk, desc = "Undo hunk staging" },
			{ "<localleader>hR", gs.reset_buffer, desc = "Reset buffer" },
			{ "<localleader>hp", gs.preview_hunk, desc = "Preview hunk" },
			{
				"<localleader>hb",
				function()
					gs.blame_line { full = true }
				end,
				desc = "Blame line",
			},
			{ "<localleader>tb", gs.toggle_current_line_blame, desc = "Toggle current line blame" },
			{ "<localleader>hd", gs.diffthis, desc = "Diff this" },
			{ "<localleader>hD", bind(gs.diffthis, "~"), desc = "Diff ~" },
			{ "<localleader>td", gs.toggle_deleted, desc = "Toggle deleted hunks" },

			-- Text object
			{ "ih", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" }, desc = "inner hunk" },
		}

		for _, map in ipairs(maps) do
			keymap(vim.tbl_extend("force", { buffer = bufnr }, map))
		end
	end,
}

plugins.neorg.keys = {
	{ "<leader>nn", "<cmd>Neorg workspace notes<cr>", desc = "View notes" },
	{ "<leader>nr", "<cmd>Neorg return<cr>", desc = "Return from notes" },
}

local hover = bind_module("hover")
plugins.hover:extend {
	keys = {
		{ "K", hover("hover"), desc = "Details popover" },
		{ "<C-p>", hover("hover_switch", "previous"), desc = "Previous source" },
		{ "<C-n>", hover("hover_switch", "next"), desc = "Next source" },
	},
}

plugins.codecompanion:extend {
	keys = {
		{ "<Leader>cc", "<cmd>CodeCompanionChat<cr>" },
	},
}
