require'lsp-format'.setup {
    typescript = {tab_width = 2},
    typescriptreact = {tab_width = 2},
    yaml = {tab_width = 2},
    lua = {},
    markdown = {}
}

local prettier = {
    formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
    formatStdin = true
}

local lua_format = {
    formatCommand = [[lua-format --double-quote-to-single-quote -i]],
    formatStdin = true
}
require'lspconfig'.efm.setup {
    on_attach = require'lsp-format'.on_attach,
    init_options = {documentFormatting = true},
    settings = {
        languages = {
            typescript = {prettier},
            typescriptreact = {prettier},
            yaml = {prettier},
            markdown = {prettier},
            lua = {lua_format}
        }
    }
}
