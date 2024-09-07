local map = vim.keymap.set
local map_opts = { noremap = true, silent = true }

-- DISABLE ARROW KEYS
map("", "<up>", "<nop>", { noremap = true })
map("", "<down>", "<nop>", { noremap = true })
map("", "<left>", "<nop>", { noremap = true })
map("", "<right>", "<nop>", { noremap = true })

map("i", "jj", "<ESC>")

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
map("v", "<C-j>", ":m .+1<CR>", map_opts)
map("v", "<C-k>", ":m .-2<CR>", map_opts)

-- Resizing panes
map("n", "<C-Left>", ":vertical resize +4<CR>", map_opts)
map("n", "<C-Right>", ":vertical resize -4<CR>", map_opts)
map("n", "<C-Up>", ":resize -4<CR>", map_opts)
map("n", "<C-Down>", ":resize +4<CR>", map_opts)

-- Terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", map_opts)
map("t", "<leader><Esc>", "<C-\\><C-n>", map_opts)

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Neo Tree
-- vim.keymap.set("n", "<C-p>", ":Neotree toggle<cr>", { noremap = true, silent = true })

map("n", "]e", vim.diagnostic.goto_next)
map("n", "[e", vim.diagnostic.goto_prev)

map("n", "<C-h>", "<C-w><C-h>", map_opts)
map("n", "<C-l>", "<C-w><C-l>", map_opts)
map("n", "<C-j>", "<C-w><C-j>", map_opts)
map("n", "<C-k>", "<C-w><C-k>", map_opts)

map("n", "<leader>h", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

map("n", "<leader>gtj", "<cmd>GoTagAdd json<cr>", map_opts)
map("n", "<leader>ife", "<cmd>GoIfErr<cr>", map_opts)

map("n", "1G", "1gt", map_opts)
map("n", "2G", "2gt", map_opts)
map("n", "3G", "3gt", map_opts)
