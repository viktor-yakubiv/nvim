local cmp = require 'cmp'
local luasnip = require 'luasnip'

require('luasnip/loaders/from_vscode').lazy_load()

--- Snippets
local snippet = {
	expand = function (args)
		luasnip.lsp_expand(args.body)
	end,
}

-- replacing useless kind for the following sources
local source_to_kind_map = {
	emoji = 'Emoji',
	buffer = 'TextMatch',
}

local apple_kind_icons = {
	Text = "􀅯",
	Method = "􀀜",
	Function = "􀝧",
	Constructor = "􀤋",
	Field = "􀂞",
	Variable = "􀂾",
	Class = "􀀈",
	Interface = "􀀔",
	Module = "􀐛",
	Property = "􀎕",
	Unit = "􀟀",
	Value = "􀅱",
	Enum = "􀋲",
	Keyword = "􁠱",
	Snippet = "􀉈",
	Color = "􀝥",
	File = "􀈸",
	Reference = "􀰞",
	Folder = "􀈖",
	EnumMember = "􀋴",
	Constant = "􀃤",
	Struct = "􀻧",
	Event = "􀋥",
	Operator = "􀅺",
	TypeParameter = "􀂺",

	TextMatch = '􀭥',
	Emoji = '􀎸',
}
local emoji_kind_icons = {
	Text = '✏️',
	Method = '⏩️',
	Function = '▶️',
	Constructor = '🧱',
	Field = '📦',
	Variable = '📥',
	Class = '💾',
	Interface = 'ℹ️',
	Module = '📦',
	Property = '🔧',
	Unit = '📏',
	Value = '🔢',
	Enum = '🔠',
	Keyword = '🔑',
	Snippet = '✂️',
	Color = '🎨',
	File = '📄',
	Reference = '🔗',
	Folder = '📁',
	EnumMember = '🔡',
	Constant = '🟰',
	Struct = '🧈',
	Event = '⚡️',
	Operator = '🔀',
	TypeParameter = '𝜯𝕋',
}
local kind_icons = apple_kind_icons
-- find more here: https://www.nerdfonts.com/cheat-sheet

--- Mappings

local has_words_before = function ()
	-- Lua 5.3 moved this, Neovim 8.2 has Lua 5.1
	local unpack = unpack or table.unpack

	local line_nr, col_nr = unpack(vim.api.nvim_win_get_cursor(0))
	local line_str = vim.api.nvim_buf_get_lines(0, line_nr - 1, line_nr, true)[1]
	return col_nr ~= 0 and line_str:sub(col_nr, col_nr):match('%s') == nil
end

local mapping = {
	['<Tab>'] = cmp.mapping(function (fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expandable() then
			luasnip.expand()
		elseif luasnip.expand_or_locally_jumpable() then
			luasnip.expand_or_jump()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end, { 'i', 's' }),

	['<S-Tab>'] = cmp.mapping(function (fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.locally_jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { 'i', 's' }),

	['<C-k>'] = cmp.mapping.select_prev_item(),
	['<C-j>'] = cmp.mapping.select_next_item(),
	['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
	['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),

	['<C-CR>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),

	['<CR>'] = cmp.mapping({
		i = function(fallback)
			if cmp.visible() and cmp.get_active_entry() then
				cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
			else
				fallback()
			end
		end,
		s = cmp.mapping.confirm({ select = true }),
	 }),
}

local window_style = cmp.config.window.bordered({
	-- border = { '▐', '▔', '▐', '▐', '▟', '▄', '▙', '▌' },
	winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
})

local function format_item(entry, vim_item)
	local kind = source_to_kind_map[entry.source.name] or vim_item.kind
	local icon = kind_icons[kind]

	vim_item.kind = string.format('%s  ', icon)
	return vim_item
end

cmp.setup {
	snippet = snippet,
	mapping = mapping,

	formatting = {
		fields = { 'kind', 'abbr' },
		format = format_item,
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'emoji', option = { insert = true } },
		{ name = 'buffer' },
		{ name = 'path' },
	}),

	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},

	window = {
		completion = window_style,
		documentation = window_style,
	},

	experimental = {
		ghost_text = true,
	},
}

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
	},
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}, {
		{ name = 'buffer' }, -- for case when substitute command typed
	})
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'emoji', option = { insert = true } },
		{ name = 'buffer' },
	}),
})
