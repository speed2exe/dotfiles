vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('pack')     -- ~/.config/nvim/lua/pack.lua
require('keymap')   -- ~/.config/nvim/lua/keymap.lua
require('settings') -- ~/.config/nvim/lua/settings.lua
require('autocmd')  -- ~/.config/nvim/lua/autocmd.lua

require('llm_completion') -- ~/.config/nvim/lua/llm_completion.lua

if vim.g.neovide then
  require('neovide') -- ~/.config/nvim/lua/neovide.lua
end
