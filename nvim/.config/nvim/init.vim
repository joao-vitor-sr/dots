let mapleader=","
call plug#begin('~/.config/nvim/plugged')

" general
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'alvarosevilla95/luatab.nvim'
Plug 'unblevable/quick-scope'
Plug 'mhartington/formatter.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'onsails/lspkind-nvim' " icons
Plug 'hrsh7th/cmp-calc'
Plug 'tami5/lspsaga.nvim'

" files
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vimwiki/vimwiki'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Tim pope plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'

" theme
Plug 'overcache/NeoSolarized'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }  

" Initialize plugin system
call plug#end()

source $HOME/.config/nvim/config/general.vim " GENERAL
source $HOME/.config/nvim/config/theme.vim " THEME
source $HOME/.config/nvim/config/vimwiki.vim " VIMWIKI
source $HOME/.config/nvim/config/sessions.vim " SESSIONS
source $HOME/.config/nvim/config/shortcuts.vim " SHORT CUTS
source $HOME/.config/nvim/config/telescope.vim " TELESCOPE
source $HOME/.config/nvim/config/nvim-tree-config.vim
source $HOME/.config/nvim/config/quick-scope-config.vim

" lua configs
luafile $HOME/.config/nvim/lua/lualine-config.lua
luafile $HOME/.config/nvim/lua/nvim-tree-config.lua

" LSP
luafile $HOME/.config/nvim/lua/lspconfig-config.lua
luafile $HOME/.config/nvim/lua/cmp-config.lua

" LSP LANGUAGUES
luafile $HOME/.config/nvim/lua/languages/lua.lua
luafile $HOME/.config/nvim/lua/languages/signature.lua

" TREE SITTER
luafile $HOME/.config/nvim/lua/nvim-treesitter-config.lua

" LUA LINE
luafile $HOME/.config/nvim/lua/luatab-config.lua

" FORMATTER
luafile $HOME/.config/nvim/lua/formatter-config.lua
