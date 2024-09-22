local map = vim.keymap.set
local set = vim.opt_local
local map_opts = { noremap = true, silent = true }

set.expandtab = false
set.tabstop = 4
set.shiftwidth = 4

map("n", "<leader>gtj", "<cmd>GoTagAdd json<cr>", map_opts)
map("n", "<leader>ife", "<cmd>GoIfErr<cr>", map_opts)
