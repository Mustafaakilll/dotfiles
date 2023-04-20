local M = require 'plugins.telescope.init'
local map = vim.keymap.set

map('n', '<leader>gw', M.grep_string)
map('n', '<leader>gl', M.live_grep)
map('n', '<leader>fd', M.find_files)
map('n', '<leader>fe', M.file_browser)

map('n', '<leader>gs', M.git_status)
map('n', '<leader>gc', M.git_commits)

map('n', '<leader>fb', M.buffers)
map('n', '<leader>sb', M.current_buffer_fuzzy_find)
