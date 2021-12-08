vim.g.mapleader = ","

require "paq" {
	-- general
	"kyazdani42/nvim-web-devicons",
	"alvarosevilla95/luatab.nvim",
	"unblevable/quick-scope",
	"mhartington/formatter.nvim",
	"numToStr/Comment.nvim",
	"joao-vitor-sr/nvimDvorak",
	-- lsp
	"neovim/nvim-lspconfig",
	"ray-x/lsp_signature.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"onsails/lspkind-nvim", -- icons
	"hrsh7th/cmp-calc",
	"tami5/lspsaga.nvim",
	-- files
	"kyazdani42/nvim-tree.lua",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"vimwiki/vimwiki",
	-- snippets
	"hrsh7th/vim-vsnip",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip-integ",
	-- Tim pope plugins
	"tpope/vim-sensible",
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"tpope/vim-obsession",
	"tpope/vim-repeat",
	-- theme
	"overcache/NeoSolarized",
	"nvim-lualine/lualine.nvim",
	{"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
}

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
