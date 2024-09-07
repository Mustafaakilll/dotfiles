local M = require("plugins.telescope.init")
local map = vim.keymap.set

map("n", "<leader>gw", M.grep_string)
map("n", "<leader>gl", M.live_grep)
map("n", "<leader>fd", M.find_files)
map("n", "<leader>fe", M.file_browser)

map("n", "<leader>gs", M.git_status)
map("n", "<leader>gc", M.git_commits)
map("n", "<leader>ca", M.lsp_code_actions)

map("n", "<leader>fb", M.buffers)
map("n", "<leader>sb", M.current_buffer_fuzzy_find)

map("n", "<leader>dd", M.diagnostics)
map("n", "<leader>tt", "<cmd>TodoTelescope<cr>")

map("n", "gr", M.lsp_references)
map("n", "gd", M.lsp_definition)
map("n", "gi", M.lsp_implementations)
map("n", "gT", M.lsp_type_definitions)
