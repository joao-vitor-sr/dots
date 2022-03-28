vim.g.mapleader = ","

require("plugins")

-- lua configs
require("general")
require("lualine-config")
require("nvim-tree-config")

-- LSP
require("lspconfig-config")
require("cmp-config")

-- LSP LANGUAGUES
require("lua-lang")
require("signature")

-- TREE SITTER
require("nvim-treesitter-config")
-- FORMATTER
require("formatter-config")

-- COMMENTER
require("commenter")

-- SNIPPETS
require("luasnip-config")

-- COLORIZER
require("colorizer-config")
