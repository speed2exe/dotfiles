local vim = vim
vim.loader.enable()

-- https://github.com/folke/lazy.nvim?tab=readme-ov-file#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
require('lazy').setup('plugins')

-- Custom stuff
require('keymap')   -- ~/.config/nvim/lua/keymap.lua
require('settings') -- ~/.config/nvim/lua/settings.lua
require('autocmd')  -- ~/.config/nvim/lua/autocmd.lua

-- neovide stuff
if vim.g.neovide then
	require('neovide')
end
