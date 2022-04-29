vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  use('wbthomason/packer.nvim')
	-- Tim pope plugins
	use("tpope/vim-sensible")
	use("tpope/vim-surround")
	use("tpope/vim-obsession")
	use("tpope/vim-repeat")
  use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use("unblevable/quick-scope")
	-- use("mhartington/formatter.nvim")
  use("lukas-reineke/lsp-format.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
	use("numToStr/Comment.nvim")
	use("joao-vitor-sr/nvimDvorak")

	-- lsp
	use("neovim/nvim-lspconfig")
	use("rafamadriz/friendly-snippets")
	use("ray-x/lsp_signature.nvim")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("hrsh7th/cmp-nvim-lsp")

	-- snip
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- use "~/codes/lua/nvim-cmp"
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("onsails/lspkind-nvim") -- cmp menu
	use("tami5/lspsaga.nvim") -- nightly

	-- files
	use("kyazdani42/nvim-tree.lua")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- theme
	use("shaunsingh/nord.nvim")
	use("folke/tokyonight.nvim")
	use("morhetz/gruvbox")
	use("nvim-lualine/lualine.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("norcalli/nvim-colorizer.lua")
	use("p00f/nvim-ts-rainbow")
end)
