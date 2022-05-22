vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    -- Tim pope plugins
    use('tpope/vim-sensible')
    use('tpope/vim-surround')
    use('tpope/vim-repeat')
    use({'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}})
    use('unblevable/quick-scope')
    use('justinmk/vim-sneak')
    use('lukas-reineke/lsp-format.nvim')
    use('numToStr/Comment.nvim')

    -- own plugins
    use('joao-vitor-sr/nvimDvorak') -- dvorak keyboard
    use({'joao-vitor-sr/nvimSessionManager', requires = 'tpope/vim-obsession'}) -- sessions management

    -- lsp
    use('neovim/nvim-lspconfig')
    use('rafamadriz/friendly-snippets')
    -- use('ray-x/lsp_signature.nvim')
    use({
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('trouble').setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end
    })

    -- snip
    use('L3MON4D3/LuaSnip')

    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp-signature-help', 'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'onsails/lspkind-nvim',
            'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-nvim-lsp'
        }
    })
    use('tami5/lspsaga.nvim')

    -- files
    use('kyazdani42/nvim-tree.lua')
    use({'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}})

    -- theme
    use('shaunsingh/nord.nvim')
    use('folke/tokyonight.nvim')
    use('morhetz/gruvbox')
    use('overcache/NeoSolarized')
    use('nvim-lualine/lualine.nvim')
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use('norcalli/nvim-colorizer.lua')
    use('p00f/nvim-ts-rainbow')
end)
