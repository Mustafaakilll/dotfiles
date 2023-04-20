local map = vim.keymap.set
local map_opts = { noremap = true, silent = true }

-- DISABLE ARROW KEYS
map('', '<up>', '<nop>', { noremap = true })
map('', '<down>', '<nop>', { noremap = true })
map('', '<left>', '<nop>', { noremap = true })
map('', '<right>', '<nop>', { noremap = true })

-- BUFFER MOVEMENT
-- local opts = { silent = true, nowait = true }
-- map('n', '<A-,>', ':BufferLineCyclePrev<CR>', map_opts)
-- map('n', '<A-.>', ':BufferLineCycleNext<CR>', map_opts)
-- map('n', 'gb', ':BufferLinePick<CR>', opts)
-- map('n', '<leader>db', ':bdelete!<CR>', opts)
--
-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N', map_opts)

-- Move line up and down in NORMAL modes
map('n', '<C-j>', ':m .+1<CR>', map_opts)
map('n', '<C-k>', ':m .-2<CR>', map_opts)

-- Resizing panes
map("n", "<C-Left>", ":vertical resize +4<CR>", map_opts)
map("n", "<C-Right>", ":vertical resize -4<CR>", map_opts)
map("n", "<C-Up>", ":resize -4<CR>", map_opts)
map("n", "<C-Down>", ":resize +4<CR>", map_opts)

-- Terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", map_opts)
map("t", "<leader><Esc>", "<C-\\><C-n>", map_opts)

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
