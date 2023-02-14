vim.g.loaded_matchparent = 1
vim.g.did_load_filetypes = 1
local g = vim.g
local cmd = vim.cmd
local opt = vim.opt
local exec = vim.api.nvim_exec

-- Leader/local leader
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- Skip some remote provider loading
g.node_host_prog = '/usr/bin/neovim-node-host'

g.dart_format_on_save = 1

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

-- Commands
cmd [[command! WhatHighlight :call util#syntax_stack()]]
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]
cmd [[colorscheme doom-one]]
cmd [[au BufWritePre * :%s/\s\+$//e]]
cmd [[command! FlutterDebug flutter run --debug]]
g.copilot_node_command = "~/.local/share/nvm/v16.17.0/bin/node"
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]


-- Highlight yank'd text after yankin'
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
  'tarPlugin',
  'zipPlugin',
  'tar',
  'zip',
  'netrwPlugin',
}

for i = 1, 10 do
  g['loaded_' .. disabled_built_ins[i]] = 1
end
