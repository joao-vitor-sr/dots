vim.api.nvim_set_keymap("v", ">", ">gv", {noremap = true})
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap = true})

vim.api.nvim_set_keymap("n", "j", "v:count  ? 'j' : 'gj'", {noremap = true, expr = true})
vim.api.nvim_set_keymap("n", "k", "v:count  ? 'k' : 'gk'", {noremap = true, expr = true})

vim.api.nvim_set_keymap("n", "<c-t>", ":wincmd k<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<c-h>", ":wincmd j<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<c-d>", ":wincmd h<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<c-n>", ":wincmd l<CR>", {silent = true})

vim.api.nvim_command("set termguicolors")
vim.api.nvim_command("set encoding=UTF-8")

vim.api.nvim_command("set nu rnu")

vim.api.nvim_command([[let g:tokyonight_style = 'night' " available: night, storm]])
vim.api.nvim_command([[let g:tokyonight_enable_italic = 1"]])

vim.api.nvim_command("colorscheme tokyonight")

vim.api.nvim_command("let g:qs_highlight_on_keys = []")

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", {noremap = true})

vim.api.nvim_set_keymap("v", "<leader>y", '"+y', {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', {noremap = true})

vim.api.nvim_set_keymap("i", ",", ",<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", "!", "!<c-g>u", {noremap = true})
vim.api.nvim_set_keymap("i", "?", "?<c-g>u", {noremap = true})

vim.api.nvim_set_keymap("n", "n", "nzzzv", {noremap = true})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {noremap = true})

vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true})

vim.api.nvim_set_keymap("n", "S", ":%s//g<Left><Left>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>s", ":s//g<Left><Left>", {})

vim.api.nvim_set_keymap("n", "<ESC>", ":noh<CR>", {noremap = true})

vim.api.nvim_set_keymap("i", "<C-h>", "<esc>:m .+1<CR>==", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-t>", "<esc>:m .-2<CR>==", {noremap = true})
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>j", ":m .+1<CR>==", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>k", ":m .-2<CR>==", {noremap = true})

vim.api.nvim_set_keymap("n", "ZA", ":wqa!<CR>", {noremap = true})

require("luatab").setup {}

vim.api.nvim_command(
	"au BufReadPost,BufNewFile ~/codes/php/desenvolvimento/* set tabstop=2 shiftwidth=2 expandtab smarttab"
)
vim.api.nvim_command("au BufReadPost,BufNewFile ~/codes/js/zaap_front/* set tabstop=2 shiftwidth=2 expandtab smarttab")
vim.api.nvim_command("au BufReadPost,BufNewFile *.c set tabstop=2 shiftwidth=2 expandtab smarttab")

vim.api.nvim_command(
	"autocmd TextYankPost * silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank {higroup='Visual', timeout=500}"
)

vim.api.nvim_command("let g:session_dir = '~/.config/nvim/sessions'")
vim.api.nvim_command("exec 'nnoremap <Leader>ss :Obsession ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'")
vim.api.nvim_set_keymap("n", "<leader>sp", ":Obsession<CR>", {noremap = true})
vim.api.nvim_command("exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'")

vim.api.nvim_command("let g:vsnip_filetypes = {}")
vim.api.nvim_command("let g:vsnip_filetypes.javascript = ['javascript']")
vim.api.nvim_command("let g:vsnip_filetypes.javascriptreact = ['javascriptreact']")
vim.api.nvim_command("let g:vsnip_filetypes.typescriptreact = ['typescriptreact']")
vim.api.nvim_command("let g:vsnip_filetypes.c = ['c']")
vim.api.nvim_command("let g:vsnip_filetypes.php = ['php']")

-- colorizer
require "colorizer".setup(
	{"*"},
	{
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		names = true, -- "Name" codes like Blue
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		rgb_fn = true, -- CSS rgb() and rgba() functions
		hsl_fn = true, -- CSS hsl() and hsla() functions
		css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = true -- Enable all CSS *functions*: rgb_fn, hsl_fn
	}
)
