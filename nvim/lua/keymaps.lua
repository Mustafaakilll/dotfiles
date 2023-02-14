local map = vim.api.nvim_set_keymap
local map_opts = { noremap = true, silent = true }

map('n','<leader>aw', ':CodeActionMenu<CR>',map_opts)
map('n','<leader>fa', ':FlutterRun<CR>',map_opts)

-- DISABLE ARROW KEYS
map('', '<up>', '<nop>', { noremap = true })
map('', '<down>', '<nop>', { noremap = true })
map('', '<left>', '<nop>', { noremap = true })
map('', '<right>', '<nop>', { noremap = true })

-- BUFFER MOVEMENT
local opts = { silent = true, nowait = true }
map('n', '<A-,>', ':BufferLineCyclePrev<CR>', map_opts)
map('n', '<A-.>', ':BufferLineCycleNext<CR>', map_opts)
map('n', 'gb', ':BufferLinePick<CR>', opts)
map('n', '<leader>db', ':bdelete!<CR>', opts)

-- Find word/file across project
map("n", "<Leader>pf", "yiw<CMD>Telescope git_files<CR><C-r>+<ESC>", { noremap = true })
map("n", "<Leader>pw", "<CMD>Telescope grep_string<CR><ESC>", { noremap = true })

-- Nvim Tree
map('n','<C-p>',':NvimTreeToggle<CR>',map_opts)

-- LSP
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', map_opts)
map('n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', map_opts)
map('n', 'gi', '<cmd>lua require"telescope.builtin".lsp_implementations()<CR>', map_opts)
map("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", map_opts)
map("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", map_opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', map_opts)
map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", map_opts)
map("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", map_opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", map_opts)
map("n", "]e", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>", map_opts)
map("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>", map_opts)
-- map('n', '<leader>aw', '<cmd>lua require"telescope.builtin".lsp_code_actions()<CR>', map_opts)

-- Fix * (Keep the cursor position, don't move to next match)
map('n','*','*N',map_opts)

-- Move line up and down in NORMAL modes
map('n','<C-j>','<cmd>move .+1<CR>',map_opts)
map('n','<C-k>','<cmd>move .-2<CR>',map_opts)

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', map_opts)
map('n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', map_opts)
map('n', 'gi', '<cmd>lua require"telescope.builtin".lsp_implementations()<CR>', map_opts)
map("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", map_opts)
map("v", "<leader>aw", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", map_opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', map_opts)
map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", map_opts)
map("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", map_opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", map_opts)
map("n", "]e", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>", map_opts)
map("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>", map_opts)
map('n', 'gS', '<cmd>lua vim.lsp.buf.signature_help()<CR>', map_opts)
map('n', 'gTD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', map_opts)

-- Resizing panes
map("n", "<Left>", ":vertical resize +4<CR>", map_opts)
map("n", "<Right>", ":vertical resize -4<CR>", map_opts)
map("n", "<Up>", ":resize -4<CR>", map_opts)
map("n", "<Down>", ":resize +4<CR>", map_opts)

-- Diagnostics
map("n", "<leader>tr", "<cmd>Trouble<cr>", map_opts)
map("n", "<leader>tl", "<cmd>Trouble loclist<cr>", map_opts)
map("n", "<leader>tq", "<cmd>Trouble quickfix<cr>",map_opts)
map("n", "gR", "<cmd>Trouble lsp_references<cr>",map_opts)

-- Telescope
map('n', '<c-f>', ':Telescope find_files theme=get_dropdown<cr>', {noremap = true})
map('n', '<c-s>', ':Telescope git_status theme=get_dropdown<cr>', {noremap = true})
map('n', '<c-l>', ':Telescope live_grep theme=get_dropdown<cr>', {noremap = true})
map('n', '<c-b>', ':Telescope buffers show_all_buffers=true theme=get_dropdown<cr>', {noremap = true})
map('n', '<c-e>', ':Telescope frecency theme=get_dropdown<cr>', {noremap = true})
