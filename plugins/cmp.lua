local cmp_loaded, cmp = pcall(require, 'cmp')
if not cmp_loaded then
  return
end

local snippet_engine_loaded, luasnip = pcall(require, 'luasnip')
if not snippet_engine_loaded then
  return
end

require('luasnip/loaders/from_vscode').lazy_load()

local check_backspace = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

--   פּ ﯟ   some other good icons
local kind_icons = {
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
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
    ['<C-CR>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },

  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s  ', kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
				gitmoji = 'Gitmoji',
        luasnip = '[Snippet]',
        buffer = '[Buffer]',
        path = '[Path]',
        emoji = '[Emoji]',
      })[entry.source.name]
      return vim_item
    end,
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = "emoji", insert = true },
    { name = 'buffer' },
    { name = 'path' },
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  experimental = {
    ghost_text = true,
  },
}

function cmp.setup_gitcommit()
	cmp.setup.buffer {
		sources = {
			{ name = 'gitmoji' }
		}
	}
end

vim.cmd('autocmd FileType gitcommit lua require"cmp".setup_gitcommit()')
