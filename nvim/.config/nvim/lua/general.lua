local map = vim.api.nvim_set_keymap
local command = vim.api.nvim_command
local optsSilent = {silent = true}

-- add the >> feature for visual mode
map('v', '>', '>gv', {noremap = true})
map('v', '<', '<gv', {noremap = true})

-- move the cursor when the line is too long
map('n', 'j', 'v:count  ? \'j\' : \'gj\'', {noremap = true, expr = true})
map('n', 'k', 'v:count  ? \'k\' : \'gk\'', {noremap = true, expr = true})

-- orientation in splits
map('n', '<c-t>', ':wincmd k<CR>', optsSilent)
map('n', '<c-h>', ':wincmd j<CR>', optsSilent)
map('n', '<c-d>', ':wincmd h<CR>', optsSilent)
map('n', '<c-n>', ':wincmd l<CR>', optsSilent)

-- general theme
command('set termguicolors')
command('set encoding=UTF-8')
command('set nu rnu')
command([[let g:tokyonight_style = 'night' " available: night, storm]])
command([[let g:tokyonight_enable_italic = 1"]])
vim.cmd([[colorscheme NeoSolarized]])
command('let g:qs_max_chars=150')
command('set colorcolumn=80')

-- mappings for copy and paste
map('v', '<leader>y', '"+y', {noremap = true})
map('n', '<leader>p', '"+p', {noremap = true})

-- better undo for insert
map('i', ',', ',<c-g>u', {noremap = true})
map('i', '.', '.<c-g>u', {noremap = true})
map('i', '!', '!<c-g>u', {noremap = true})
map('i', '?', '?<c-g>u', {noremap = true})

-- keep the next item in select mode centered
map('n', 'n', 'nzzzv', {noremap = true})
map('n', 'N', 'Nzzzv', {noremap = true})

-- mapping for yank until the end of the line
map('n', 'Y', 'y$', {noremap = true})

-- mapping to change the content of the current file
map('n', '<leader>fs', ':%s//g<Left><Left>', {noremap = true})
map('n', '<leader>fa', ':s//g<Left><Left>', {})

-- executes the noh command when esc is pressed
map('n', '<ESC>', ':noh<CR>', {noremap = true})

-- move the current line up or down
map('i', '<C-h>', '<esc>:m .+1<CR>==', {noremap = true})
map('i', '<C-t>', '<esc>:m .-2<CR>==', {noremap = true})
map('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true})
map('v', 'K', ':m \'<-2<CR>gv=gv', {noremap = true})
map('n', '<leader>j', ':m .+1<CR>==', {noremap = true})
map('n', '<leader>k', ':m .-2<CR>==', {noremap = true})

-- mapping for ZA to close and save all files
map('n', 'ZA', ':wqa!<CR>', {noremap = true})

-- commands for identation
command(
    'au BufReadPost,BufNewFile *Makefile set autoindent noexpandtab tabstop=4 shiftwidth=4')
command(
    'au BufReadPost,BufNewFile *.c set tabstop=2 shiftwidth=2 expandtab smarttab')
command(
    'au BufReadPost,BufNewFile *.cpp set tabstop=2 shiftwidth=2 expandtab smarttab')

command('set tabstop=2 shiftwidth=2 expandtab smarttab')

-- enable or disables the Obsession plugin
map('n', '<leader>sp', ':Obsession<CR>', {noremap = true})

-- vim sneak
command('let g:sneak#label = 1')

