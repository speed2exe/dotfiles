local vim = vim
vim.loader.enable()

-- https://lazy.folke.io/installation
require("config.lazy") -- ~/.config/nvim/lua/config/lazy.lua

-- Custom stuff
require('keymap')   -- ~/.config/nvim/lua/keymap.lua
require('settings') -- ~/.config/nvim/lua/settings.lua
require('autocmd')  -- ~/.config/nvim/lua/autocmd.lua

-- neovide stuff
if vim.g.neovide then
	require('neovide') -- ~/.config/nvim/lua/neovide.lua
end
