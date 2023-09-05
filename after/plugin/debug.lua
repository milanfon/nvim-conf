require('dap-vscode-js').setup({
    adapters = {'pwa-node'},
})

local dap = require('dap')

dap.configurations.javascript = {{
    name = 'Launch file',
    type = 'pwa-node',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
}}

vim.keymap.set("n","<leader>dc",":DapContinue<CR>");
