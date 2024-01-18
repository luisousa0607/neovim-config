local km = vim.keymap

km.set("n", "<leader>w", "<cmd>update<cr>", {silent = true, desc = "Write file"})
km.set("n", "<leader>wq", "<cmd>x<cr>", {silent = true, desc = "Write and quit"})

-- Move lines
km.set('n', '<leader><Up>', '<cmd>move .-2<CR>==')
km.set('n', '<leader><Down>', '<cmd>move .+1<CR>==')



