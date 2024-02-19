local opt = vim.opt

-- prevent netrw from loading
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- line number
opt.number = true
opt.relativenumber = true

-- tabs & identation
opt.tabstop = 4 -- spaces for tabs
opt.shiftwidth = 4 -- spaces for indent width
opt.smartindent = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case then case-sensitive

-- map russian keys to english
opt.langmap =
  'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

-- highlight current line
opt.cursorline = false

opt.mouse = nil -- disable mouse

-- use system clipboard as default register
opt.clipboard:append 'unnamedplus'

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- opt.iskeyword:append '-' -- consider string-string as whole word

opt.signcolumn = 'yes' -- show sign column so that text doesn't shift
opt.numberwidth = 3 -- minimal amount of columns to use for the line number
opt.scrolloff = 8 -- minimal number of screen lines to keep above and below cursor

-- enables 24-bit RGB color in the TUI
opt.termguicolors = true
