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
vim.api.nvim_command("colorscheme NeoSolarized")

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

vim.api.nvim_command("let g:vimwiki_list = [{'path': '~/Documents/vimwiki'}]")

require("luatab").setup {}
