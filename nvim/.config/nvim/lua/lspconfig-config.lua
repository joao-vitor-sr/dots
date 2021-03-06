local nvim_lsp = require('lspconfig')

local lspsaga = require('lspsaga')
lspsaga.setup({
    -- defaults ...
    debug = false,
    use_saga_diagnostic_sign = true,
    -- diagnostic sign
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    -- code action title icon
    code_action_icon = ' ',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10,
    finder_action_keys = {
        open = 'o',
        vsplit = 's',
        split = 'i',
        quit = 'q',
        scroll_down = '<C-f>',
        scroll_up = '<C-b>'
    },
    code_action_keys = {quit = 'q', exec = '<CR>'},
    rename_action_keys = {quit = '<C-c>', exec = '<CR>'},
    definition_preview_icon = '  ',
    border_style = 'single',
    rename_prompt_prefix = '➤',
    server_filetype_map = {},
    diagnostic_prefix_format = '%d. '
})
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>Lspsaga preview_definition<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>wa',
                   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr',
                   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl',
                   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                   opts)
    buf_set_keymap('n', '<leader>D',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>q',
                   '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>lk', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('formatting')

local servers = {
    'tsserver', 'eslint', 'clangd', 'intelephense', 'hls', 'pyright',
    'rust_analyzer', 'bashls', 'jsonls'
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {debounce_text_changes = 150}
    })
end

require('lua-lang')

vim.api.nvim_set_keymap('n', '<leader>e',
                        '<cmd>Lspsaga show_line_diagnostics<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>Lspsaga rename<cr>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>Lspsaga lsp_finder<cr>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_next<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ']d', '<cmd>Lspsaga` diagnostic_jump_prev<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>',
                        {noremap = true, silent = true})

local configs = require 'lspconfig.configs'

-- Check if the config is already defined (useful when reloading this file)
if not configs.stupid_lsp then
    configs.stupid_lsp = {
        default_config = {
            cmd = {
                vim.env.HOME .. '/codes/js/lsp-stupid/bin/stupid-lsp', '--stdio'
            },
            filetypes = {'txt', 'text'},
            root_dir = require('lspconfig').util.find_git_ancestor,
            settings = {disableBadLanguage = true}
        }
    }
end

require('lspconfig').stupid_lsp.setup {}
