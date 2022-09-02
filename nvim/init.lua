local cmd = vim.cmd
require('plugins')
require('keymap')
require('settings')

-- custom stuff
require('last_used')
require('nvim-lspconfig_setup')
require('autocmd')

cmd [[
    " https://stackoverflow.com/questions/630884/opening-vim-help-in-a-vertical-split-window
    autocmd FileType help wincmd L

    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]]
