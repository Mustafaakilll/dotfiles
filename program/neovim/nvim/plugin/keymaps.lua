local map = vim.keymap.set
local map_opts = { noremap = true, silent = true }

-- Clear highlights on search when pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Switch to normal mode with jj keys
map("i", "jj", "<ESC>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier for people to discover.
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Use arrow keys for tab navigation
map("n", "<left>", "gT")
map("n", "<right>", "gt")

-- Remove arrow keys
map("", "<up>", "<nop>", { noremap = true })
map("", "<down>", "<nop>", { noremap = true })

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- BUFFER MOVEMENT
-- local opts = { silent = true, nowait = true }
map("n", "<A-,>", ":BufferLineCyclePrev<CR>", map_opts)
map("n", "<A-.>", ":BufferLineCycleNext<CR>", map_opts)
map("n", "<leader>pb", ":BufferLinePick<CR>", map_opts)
map("n", "<leader>db", ":bdelete!<CR>", map_opts)
--
-- Fix * (Keep the cursor position, don't move to next match)
map("n", "*", "*N", map_opts)

-- Move line up and down in NORMAL modes
map("n", "<A-j>", ":m .+1<CR>", map_opts)
map("n", "<A-k>", ":m .-2<CR>", map_opts)

-- Resizing panes
map("n", "<C-Left>", ":vertical resize +4<CR>", map_opts)
map("n", "<C-Right>", ":vertical resize -4<CR>", map_opts)
map("n", "<C-Up>", ":resize -4<CR>", map_opts)
map("n", "<C-Down>", ":resize +4<CR>", map_opts)

-- Neo Tree
-- vim.keymap.set("n", "<C-p>", ":Neotree toggle<cr>", { noremap = true, silent = true })
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<C-p>", require("oil").toggle_float, { desc = "Open directory float mode" })

-- Go to diagnostics
map("n", "]e", vim.diagnostic.goto_next)
map("n", "[e", vim.diagnostic.goto_prev)

map("n", "<leader>gtj", "<cmd>GoTagAdd json<cr>", map_opts)
map("n", "<leader>ife", "<cmd>GoIfErr<cr>", map_opts)

map("n", "<leader>tt", "<cmd>TodoTelescope<cr>")

map("n", "<leader>gcs", "<cmd>LspStart golangci_lint_ls<cr>")
map("n", "<leader>gct", "<cmd>LspStop golangci_lint_ls<cr>")

vim.keymap.set("n", ",st", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.term()
end)
