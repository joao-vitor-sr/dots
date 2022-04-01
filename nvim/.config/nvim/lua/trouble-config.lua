local maps = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

-- Lua
maps('n', '<leader>xx', '<cmd>Trouble<cr>', opts)
maps('n', '<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>', opts)
maps('n', '<leader>xd', '<cmd>Trouble document_diagnostics<cr>', opts)
maps('n', '<leader>xl', '<cmd>Trouble loclist<cr>', opts)
maps('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', opts)
maps('n', 'gR', '<cmd>Trouble lsp_references<cr>', opts)
