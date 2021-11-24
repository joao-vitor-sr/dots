let mapleader=","
call plug#begin('~/.config/nvim/plugged')

" general
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'ryanoasis/vim-devicons'
Plug 'mkitt/tabline.vim'

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

" theme
Plug 'altercation/vim-colors-solarized'
Plug 'nvim-lualine/lualine.nvim'

" Initialize plugin system
call plug#end()

source $HOME/.config/nvim/config/general.vim " GENERAL
source $HOME/.config/nvim/config/theme.vim " THEME
source $HOME/.config/nvim/config/vimwiki.vim " VIMWIKI
source $HOME/.config/nvim/config/sessions.vim " SESSIONS
source $HOME/.config/nvim/config/shortcuts.vim " SHORT CUTS
source $HOME/.config/nvim/config/nerdTree.vim " NERD TREE
source $HOME/.config/nvim/config/telescope.vim " TELESCOPE
source $HOME/.config/nvim/config/nvim-tree-config.vim

" lua configs
luafile $HOME/.config/nvim/lua/lualine-config.lua
luafile $HOME/.config/nvim/lua/nvim-tree-config.lua

" LSP
source $HOME/.config/nvim/config/lsp-config.vim
luafile $HOME/.config/nvim/lua/cmp-config.lua

" LSP LANGUAGUES
luafile $HOME/.config/nvim/lua/languages/typescript.lua
luafile $HOME/.config/nvim/lua/languages/eslint.lua
luafile $HOME/.config/nvim/lua/languages/clangd.lua
luafile $HOME/.config/nvim/lua/languages/php.lua
luafile $HOME/.config/nvim/lua/languages/lua.lua
luafile $HOME/.config/nvim/lua/languages/signature.lua
luafile $HOME/.config/nvim/lua/languages/vimls.lua
