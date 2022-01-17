vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require "cmp"
local cmp_buffer = require("cmp_buffer")

local lspkind = require "lspkind"
lspkind.init()

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
					luasnip = "[LuaSnip]",
					treesitter = "[treesitter]",
					look = "[Look]",
					path = "[Path]",
					spell = "[Spell]",
					calc = "[Calc]"
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
			["<C-Period>"] = cmp.mapping.close(),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
			["<tab>"] = cmp.config.disable,
			["<C-b>"] = cmp.mapping.confirm({select = true}),
			["<C-d>"] = cmp.mapping(
				function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
					end
				end,
				{"i", "s"}
			),
			["<C-i>"] = cmp.mapping(
				function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
					end
				end,
				{"i", "s"}
			)
		},
		-- REQUIRED - you must specify a snippet engine
		snippet = {
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			end
		},
		sources = {
			{name = "nvim_lsp"},
			{name = "vsnip"} -- For vsnip users.
			-- {name = "buffer", keyword_length = 5}
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
