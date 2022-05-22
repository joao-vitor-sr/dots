vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local luasnip = require('luasnip')

-- Setup nvim-cmp.
local cmp = require('cmp')
local cmp_buffer = require('cmp_buffer')

local lspkind = require('lspkind')
lspkind.init()

cmp.setup({
	completion = {
		keyword_length = 1,
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = false,
			menu = {
				nvim_lsp = '[LSP]',
				buffer = '[Buffer]',
				nvim_lua = '[Lua]',
				luasnip = '[LuaSnip]',
				treesitter = '[treesitter]',
				look = '[Look]',
				path = '[Path]',
				spell = '[Spell]',
			},
		}),
	},
	mapping = {
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	-- REQUIRED - you must specify a snippet engine
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	sources = {
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' }, -- For luasnip users.
		{ name = 'nvim_lsp' },
		{ name = 'path' }, -- For luasnip users.
		-- {name = "buffer", keyword_length = 5}
	},
	sorting = {
		comparators = {
			function(...)
				return cmp_buffer:compare_locality(...)
			end,
			-- The rest of your comparators...
		},
	},
})

cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' },
	},
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}),
})
