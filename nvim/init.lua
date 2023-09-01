vim.loader.enable()

require('plugins')  -- ~/.config/nvim/lua/plugins.lua
require('keymap')   -- ~/.config/nvim/lua/keymap.lua
require('settings') -- ~/.config/nvim/lua/settings.lua

-- neovide stuff
if vim.g.neovide then
    require('neovide_conf')
end
