-- Don't wrap lines
vim.opt.wrap = false

-- vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.shada = { "'10", "<0", "s10", "h" }

-- Dont want swapfile
vim.opt.swapfile = false
vim.opt.writebackup = false

-- Indentation when new line
vim.opt.smartindent = true

-- Show which mode is active
vim.opt.showmode = true

vim.opt.whichwrap = vim.o.whichwrap .. "<,>,[,]"
vim.opt.expandtab = true
vim.opt.showmatch = true

vim.opt.colorcolumn = "120"
--
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.opt.formatoptions:remove("o")

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

vim.opt.inccommand = "split"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

vim.opt.guicursor = ""
