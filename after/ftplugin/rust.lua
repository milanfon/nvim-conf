vim.keymap.set("n", "<leader>rr", ":!cargo run<CR>")
vim.keymap.set("n", "<leader>rc", ":!cargo check<CR>")
vim.keymap.set("n", "<leader>re", ":!RUST_BACKTRACE=1 cargo run<CR>")
vim.keymap.set("n", "<leader>r", function() 
    print("(R)un, (C)heck, (E)Backtrace")
end)
vim.keymap.set("n", "<leader>rt", ":tabnew | term cargo run<CR>i")
