vim.loader.enable()

require('plugins')  -- ~/.config/nvim/lua/plugins.lua
require('keymap')   -- ~/.config/nvim/lua/keymap.lua
require('settings') -- ~/.config/nvim/lua/settings.lua

-- custom stuff
require('last_used')            -- ~/.config/nvim/lua/last_used.lua
require('autocmd')              -- ~/.config/nvim/lua/autocmd.lua

vim.cmd [[
    " https://stackoverflow.com/questions/630884/opening-vim-help-in-a-vertical-split-window
    autocmd FileType help wincmd L

    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]]

-- neovide stuff
if vim.g.neovide then
    require('neovide_conf')
end
