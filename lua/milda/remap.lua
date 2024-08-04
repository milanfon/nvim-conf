vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>w", vim.cmd.w)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>h", vim.cmd.tabprev)
vim.keymap.set("n", "<leader>l", vim.cmd.tabnext) 
vim.keymap.set("n", "Q", vim.cmd.tabprev)
vim.keymap.set("n", "W", vim.cmd.tabnext) 
vim.keymap.set("n", "<leader>+", ":tabn 1<CR>") 
vim.keymap.set("n", "<leader>ě", ":tabn 2<CR>") 
vim.keymap.set("n", "<leader>š", ":tabn 3<CR>") 
vim.keymap.set("n", "<leader>č", ":tabn 4<CR>") 
vim.keymap.set("n", "<leader>ř", ":tabn 5<CR>") 
vim.keymap.set("n", "<leader>ž", ":tabn 6<CR>") 
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnew) 
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose) 

vim.keymap.set("n", "<leader>tw", ":belowright 15split | term<CR>")

vim.keymap.set("n", "<C-n>", ":cnext<CR>")
vim.keymap.set("n", "<C-p>", ":cprev<CR>")

-- Git
vim.keymap.set("n", "<leader>ga", ":Gwrite<CR>")
vim.keymap.set("n", "<leader>gA", ":Git add ")
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
vim.keymap.set("n", "<leader>gp", ":Git push ")
vim.keymap.set("n", "<leader>gs", ":Git status<CR>")
