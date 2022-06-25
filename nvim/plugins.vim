call plug#begin('~/.vim/plugged')

" Auto save
Plug 'Pocco81/AutoSave.nvim'

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

" lsp-kind
Plug 'onsails/lspkind-nvim'

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

" nvim-cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
" Plug 'hrsh7th/cmp-copilot'
Plug 'dmitmel/cmp-digraphs'
Plug 'uga-rosa/cmp-dictionary'
Plug 'mtoohey31/cmp-fish'
Plug 'ray-x/cmp-treesitter'

" snippets
Plug 'dcampos/nvim-snippy'
Plug 'honza/vim-snippets'
Plug 'dcampos/cmp-snippy'

" Smooth Scrolling
Plug 'karb94/neoscroll.nvim'

" nvim-tree
Plug 'kyazdani42/nvim-tree.lua'

if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    PlugInstall --sync | q
endif

call plug#end()

lua << EOF
    require('autosave_conf')                -- ~/.config/nvim/lua/autosave_conf.lua
    require('nvim-web-devicons')            -- ~/.config/nvim/lua/nvim-web-devicons_conf.lua
    require('nvim-tree_conf')               -- ~/.config/nvim/lua/nvim-tree_conf.lua
    require('lualine_conf')                 -- ~/.config/nvim/lua/lualine_conf.lua
    require('nvim-lsp-installer_conf')      -- ~/.config/nvim/lua/nvim-lsp-installer_conf.lua
    require('nvim-web-devicons')            -- ~/.config/nvim/lua/nvim-web-devicons_conf.lua
    require('telescope_conf')               -- ~/.config/nvim/lua/telescope_conf.lua
    require('treesitter_conf')              -- ~/.config/nvim/lua/treesitter_conf.lua
    require('treesitter-refactor_conf')     -- ~/.config/nvim/lua/treesitter-refactor_conf.lua
    require('lspkind_conf')                 -- ~/.config/nvim/lua/lspkind_conf.lua
    require('nvim-cmp_conf')                -- ~/.config/nvim/lua/nvim-cmp_conf.lua
    require('project_conf')                 -- ~/.config/nvim/lua/project_conf.lua
    require('nvim-ts-rainbow_conf')         -- ~/.config/nvim/lua/nvim-ts-rainbow_conf.lua
    require('nvim-navic_conf')              -- ~/.config/nvim/lua/nvim-navic_conf.lua
    require('indent-blankline_conf')        -- ~/.config/nvim/lua/indent-blankline_conf.lua
    require('neoscroll_conf')               -- ~/.config/nvim/lua/neoscroll_conf.lua

    require('gitsigns').setup{}

    -- custom plugin (self made)
    require('last_used')					-- ~/.config/nvim/lua/last_used.lua
EOF

colorscheme dracula
