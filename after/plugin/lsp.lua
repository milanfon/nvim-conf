local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
        {name = 'buffer'},
        {name = 'path'}
    }
})

lsp.setup_nvim_cmp({
    mapping = {
        ['<S-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<S-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
        ['<C-Space>'] = cmp.mapping.complete()
    }
})

require('lspconfig').texlab.setup{
    filetypes = {"tex", "bib"},
    settings = {
        texlab = {
--            build = {
--                executable = "pdflatex",
--                isContinuous = true,
--                onSave = true
--            },
--            chktex = {
--                onEdit = true,
--                onOpenAndSave = true,
--            },
        }
    }
}

require('lspconfig').clangd.setup{
    filetypes = {"c", "cpp", "h", "hpp", "cl"}
}

lsp.configure('emmet_ls', {
    filetypes = { 'html', 'css', 'typescriptreact', 'javascriptreact', 'javascript', 'typescript', 'javascript.jsx', 'typescript.tsx', 'sass', 'scss', 'less' },
    init_options = {
        html = {
            options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
            },
        },
    }
})

lsp.setup()
