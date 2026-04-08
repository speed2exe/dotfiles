vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('pack')     -- ~/.config/nvim/lua/pack.lua
require('keymap')   -- ~/.config/nvim/lua/keymap.lua
require('settings') -- ~/.config/nvim/lua/settings.lua
require('autocmd')  -- ~/.config/nvim/lua/autocmd.lua

if vim.g.neovide then
  require('neovide') -- ~/.config/nvim/lua/neovide.lua
end
