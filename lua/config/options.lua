local undo_dir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undo_dir, "p")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.termguicolors = true

opt.number = true
opt.relativenumber = true

opt.splitright = true
opt.splitbelow = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.wrap = false

opt.undodir = undo_dir
opt.undofile = true

opt.clipboard = "unnamedplus"
