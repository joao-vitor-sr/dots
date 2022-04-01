local map = vim.api.nvim_set_keymap
local command = vim.api.nvim_command
local optsSilent = { silent = true }

map('v', '>', '>gv', { noremap = true })
map('v', '<', '<gv', { noremap = true })

map('n', 'j', "v:count  ? 'j' : 'gj'", { noremap = true, expr = true })
map('n', 'k', "v:count  ? 'k' : 'gk'", { noremap = true, expr = true })

map('n', '<c-t>', ':wincmd k<CR>', optsSilent)
map('n', '<c-h>', ':wincmd j<CR>', optsSilent)
map('n', '<c-d>', ':wincmd h<CR>', optsSilent)
map('n', '<c-n>', ':wincmd l<CR>', optsSilent)

command('set termguicolors')
command('set encoding=UTF-8')

command('set nu rnu')

command([[let g:tokyonight_style = 'night' " available: night, storm]])
command([[let g:tokyonight_enable_italic = 1"]])

vim.cmd([[colorscheme tokyonight]])

command('let g:qs_max_chars=150')
command('set colorcolumn=80')

map(
	'n',
	'<leader>ff',
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
	{ noremap = true }
)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true })
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true })
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true })

map('v', '<leader>y', '"+y', { noremap = true })
map('n', '<leader>p', '"+p', { noremap = true })

map('i', ',', ',<c-g>u', { noremap = true })
map('i', '.', '.<c-g>u', { noremap = true })
map('i', '!', '!<c-g>u', { noremap = true })
map('i', '?', '?<c-g>u', { noremap = true })

map('n', 'n', 'nzzzv', { noremap = true })
map('n', 'N', 'Nzzzv', { noremap = true })

map('n', 'Y', 'y$', { noremap = true })

map('n', 'S', ':%s//g<Left><Left>', { noremap = true })
map('n', '<leader>s', ':s//g<Left><Left>', {})

map('n', '<ESC>', ':noh<CR>', { noremap = true })

map('i', '<C-h>', '<esc>:m .+1<CR>==', { noremap = true })
map('i', '<C-t>', '<esc>:m .-2<CR>==', { noremap = true })
map('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })
map('n', '<leader>j', ':m .+1<CR>==', { noremap = true })
map('n', '<leader>k', ':m .-2<CR>==', { noremap = true })

map('n', 'ZA', ':wqa!<CR>', { noremap = true })

command('au BufReadPost,BufNewFile *Makefile set autoindent noexpandtab tabstop=4 shiftwidth=4')
command('au BufReadPost,BufNewFile *.c set tabstop=2 shiftwidth=2 expandtab smarttab')
command('au BufReadPost,BufNewFile *.cpp set tabstop=2 shiftwidth=2 expandtab smarttab')

command('set tabstop=2 shiftwidth=2 expandtab smarttab')
command("let g:session_dir = '~/.config/nvim/sessions'")
command("exec 'nnoremap <Leader>ss :Obsession ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'")
map('n', '<leader>sp', ':Obsession<CR>', { noremap = true })
command("exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'")

command('let g:vsnip_filetypes = {}')
command("let g:vsnip_filetypes.javascript = ['javascript']")
command("let g:vsnip_filetypes.javascriptreact = ['javascriptreact']")
command("let g:vsnip_filetypes.typescriptreact = ['typescriptreact']")
command("let g:vsnip_filetypes.c = ['c']")
command("let g:vsnip_filetypes.php = ['php']")
