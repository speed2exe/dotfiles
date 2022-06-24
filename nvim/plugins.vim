call plug#begin('~/.vim/plugged')

" Project management
Plug 'ahmedkhalf/project.nvim'

" Fancy Start Screen
Plug 'mhinz/vim-startify'

" Indent guide lines
Plug 'lukas-reineke/indent-blankline.nvim'

" go to last cursor position
Plug 'farmergreg/vim-lastplace'

" fzf search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" https://draculatheme.com/vim
Plug 'dracula/vim', {'as': 'dracula'}

" https://github.com/lewis6991/gitsigns.nvim
Plug 'lewis6991/gitsigns.nvim'

" https://github.com/SmiteshP/nvim-navic
Plug 'SmiteshP/nvim-navic'

" lualine
Plug 'nvim-lualine/lualine.nvim'

" dev icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Telescope stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
" Plug 'nvim-lua/lsp-status.nvim'

" TreeSitter stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'

" nvim-tree
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

lua << EOF
    require('nvim-web-devicons')            -- ~/.config/nvim/lua/nvim-web-devicons_conf.lua
    require('nvim-tree_conf')               -- ~/.config/nvim/lua/nvim-tree_conf.lua
    require('lualine_conf')                 -- ~/.config/nvim/lua/lualine_conf.lua
    require('nvim-lsp-installer_conf')      -- ~/.config/nvim/lua/nvim-lsp-installer_conf.lua
    require('nvim-web-devicons')            -- ~/.config/nvim/lua/nvim-web-devicons_conf.lua
    require('telescope_conf')               -- ~/.config/nvim/lua/telescope_conf.lua
    require('treesitter_conf')              -- ~/.config/nvim/lua/treesitter_conf.lua
    require('project_conf')                 -- ~/.config/nvim/lua/project_conf.lua
    require('nvim-ts-rainbow_conf')         -- ~/.config/nvim/lua/nvim-ts-rainbow_conf.lua
    require('nvim-navic_conf')              -- ~/.config/nvim/lua/nvim-navic_conf.lua
    require('indent-blankline_conf')        -- ~/.config/nvim/lua/indent-blankline_conf.lua

    require('gitsigns').setup{}
EOF

if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    PlugInstall --sync | q
endif

colorscheme dracula
