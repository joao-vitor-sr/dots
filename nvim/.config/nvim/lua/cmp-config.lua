vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require "cmp"
local cmp_buffer = require("cmp_buffer")

local lspkind = require "lspkind"
lspkind.init()

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup(
	{
		completion = {
			keyword_length = 1
		},
		experimental = {
			ghost_text = true,
			native_menu = false
		},
		formatting = {
			format = lspkind.cmp_format {
				with_text = true,
				menu = {
					nvim_lsp = "[LSP]",
					buffer = "[Buffer]",
					nvim_lua = "[Lua]",
					-- ultisnips = "[UltiSnips]",
					treesitter = "[treesitter]",
					look = "[Look]",
					path = "[Path]",
					spell = "[Spell]",
					calc = "[Calc]",
					emoji = "[Emoji]",
					neorg = "[Neorg]"
				}
			}
		},
		mapping = {
			["<C-l>"] = cmp.mapping {
				c = function()
					if cmp.visible() then
						cmp.select_next_item {behavior = cmp.SelectBehavior.Insert}
					end
				end,
				i = function(fallback)
					if cmp.visible() then
						cmp.select_next_item {behavior = cmp.SelectBehavior.Insert}
					else
						fallback()
					end
				end
			},
			["<C-b>"] = cmp.mapping {
				c = function()
					if cmp.visible() then
						cmp.select_prev_item {behavior = cmp.SelectBehavior.Insert}
					end
				end,
				i = function(fallback)
					if cmp.visible() then
						cmp.select_prev_item {behavior = cmp.SelectBehavior.Insert}
					else
						fallback()
					end
				end
			},
			["<Down>"] = cmp.mapping.select_next_item {behavior = cmp.SelectBehavior.Select},
			["<Up>"] = cmp.mapping.select_prev_item {behavior = cmp.SelectBehavior.Select},
			["<C-Period>"] = cmp.mapping.close(),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
			["<C-f>"] = cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Replace,
				select = true
			},
			["<Tab>"] = cmp.mapping(
				function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.fn["vsnip#available"](1) == 1 then
						feedkey("<Plug>(vsnip-expand-or-jump)", "")
					elseif has_words_before() then
						cmp.complete()
					else
						fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
					end
				end,
				{"i", "s"}
			),
			["<S-Tab>"] = cmp.mapping(
				function()
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.fn["vsnip#jumpable"](-1) == 1 then
						feedkey("<Plug>(vsnip-jump-prev)", "")
					end
				end,
				{"i", "s"}
			),
			-- ... Your other mappings ...
			["<CR>"] = cmp.mapping.confirm({select = true})
		},
		-- REQUIRED - you must specify a snippet engine
		snippet = {
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			end
		},
		sources = {
			{name = "nvim_lsp"},
			{name = "vsnip"}, -- For vsnip users.
			{name = "path"},
			{name = "buffer", keyword_length = 5}
		},
		sorting = {
			comparators = {
				function(...)
					return cmp_buffer:compare_locality(...)
				end
				-- The rest of your comparators...
			}
		}
	}
)

cmp.setup.cmdline(
	"/",
	{
		sources = {
			{name = "buffer"}
		}
	}
)

cmp.setup.cmdline(
	":",
	{
		sources = cmp.config.sources(
			{
				{name = "path"}
			},
			{
				{name = "cmdline"}
			}
		)
	}
)
