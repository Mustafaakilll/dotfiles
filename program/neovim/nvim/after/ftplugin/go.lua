local map = vim.keymap.set
local map_opts = { noremap = true, silent = true }
local set = vim.opt_local

set.tabstop = 4
set.shiftwidth = 4
set.expandtab = false

map("n", "<leader>gtj", "<cmd>GoTagAdd json<cr>", map_opts)
map("n", "<leader>ife", "<cmd>GoIfErr<cr>", map_opts)
