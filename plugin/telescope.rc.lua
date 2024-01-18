local km = vim.keymap

require('telescope').setup{
  pickers = {
    find_files = {
     theme = "dropdown",
    }
  },
}
km.set("n", "fs", "<cmd>Telescope find_files<cr>") 
km.set("n", "lg", "<cmd>Telescope live_grep<cr>")
km.set("n", "hh", "<cmd>Telescope help_tags<cr>")

