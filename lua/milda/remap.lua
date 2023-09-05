vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>b", function ()
    if vim.opt.background:get() == 'light' then
	    vim.opt.background = 'dark'
    else
	    vim.opt.background = 'light'
    end
end)

vim.keymap.set("n", "<leader>w", vim.cmd.w)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>h", vim.cmd.tabprev)
vim.keymap.set("n", "<leader>l", vim.cmd.tabnext) 
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnew) 
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose) 

vim.keymap.set("n", "<C-n>", ":cnext<CR>")
vim.keymap.set("n", "<C-p>", ":cprev<CR>")
