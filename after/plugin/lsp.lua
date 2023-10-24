local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    mapping = {
        ['<S-j>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<S-k>'] = cmp.mapping.select_next_item(cmp_select),
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

lsp.setup()
