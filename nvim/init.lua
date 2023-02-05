-- speed up load time
-- comment this line if you set up for the first time
require('impatient')

require('plugins')
require('keymap')
require('settings')

-- custom stuff
require('last_used')
require('nvim-lspconfig_setup')
require('autocmd') -- ~/.config/nvim/lua/autocmd.lua

vim.cmd [[
    " https://stackoverflow.com/questions/630884/opening-vim-help-in-a-vertical-split-window
    autocmd FileType help wincmd L

    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]]
