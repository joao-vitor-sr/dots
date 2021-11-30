--- In lsp attach function
vim.api.nvim_buf_set_keymap(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", {noremap = true, silent = true})
vim.api.nvim_buf_set_keymap(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<C-u>",
	"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
	{noremap = true}
)
vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<C-d>",
	"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>",
	{noremap = true}
)
