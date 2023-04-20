vim.g.loaded_matchparent = 1
vim.g.did_load_filetypes = 1

local g = vim.g
local cmd = vim.cmd
local opt = vim.opt


-- Settings
opt.mouse = 'a'
opt.wrap = false
opt.hlsearch = false
opt.smartcase = true
opt.ignorecase = true
opt.scrolloff = 8
opt.swapfile = false
opt.tabstop = 2
opt.softtabstop = 2
opt.errorbells = false
opt.cmdheight = 1
opt.number = true
opt.relativenumber = true
opt.smartindent = true
opt.showmode = true
opt.whichwrap = vim.o.whichwrap .. '<,>,[,]'
opt.shiftwidth = 2
opt.expandtab = true
opt.showmatch = true
opt.backup = false
opt.writebackup = false
opt.joinspaces = false
opt.clipboard = 'unnamedplus'
opt.cursorline = true
opt.autoindent = true
opt.completeopt = "menu,menuone,noselect,preview"
opt.backspace = 'indent,eol,start'
opt.termguicolors = true
opt.ruler = true
opt.background='dark'

-- Commands
-- cmd [[command! WhatHighlight :call util#syntax_stack()]]
cmd [[au BufWritePre * :%s/\s\+$//e]]
-- cmd [[command! FlutterDebug flutter run --debug]]
g.copilot_node_command = "~/.local/share/nvm/v16.17.0/bin/node"
-- cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

