filetype plugin indent on
syntax on
set shell=/usr/sbin/fish
set showmode
set clipboard^=unnamed,unnamedplus
set termguicolors
set backspace=indent,eol,start
set nocompatible
set exrc
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set breakindent
set nowrap
set number
set relativenumber
set ignorecase
set smartcase
set noswapfile
set nobackup
set nowritebackup
set incsearch
set scrolloff=16
set signcolumn=yes
set colorcolumn=80
set encoding=UTF-8
set updatetime=1000
set completeopt=menu,menuone,preview,noinsert,noselect
set splitbelow
set splitright
set wildmenu
set wildmode=longest:full,full
" set autochdir "might break plugins

call plug#begin('~/.vim/plugged')
" Nice starting splash screen
Plug 'mhinz/vim-startify'

" Smooth Scrolling
Plug 'karb94/neoscroll.nvim'

" fzf search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" vim-moonfly-colors
Plug 'bluz71/vim-moonfly-colors'

" lualine
Plug 'hoob3rt/lualine.nvim'

" dev icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" tabline
Plug 'romgrk/barbar.nvim'

" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Telescope stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSP stuff
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'glepnir/lspsaga.nvim'

" TreeSitter stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'

" nvim-tree
Plug 'kyazdani42/nvim-tree.lua'

" lsp-kind
Plug 'onsails/lspkind-nvim'

" nvim-cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'ray-x/cmp-treesitter'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" kitty terminal emulator config helper
Plug 'fladson/vim-kitty'
call plug#end()

" nvim-tree Setup
" Options are currently being migrated into the setup function,
" you need to run require'nvim-tree'.setup() in your personal configurations.
" Setup should be run in a lua file or in a lua heredoc (:help lua-heredoc) 
" if using in a vim file. Note that options under the g: command should be set 
" BEFORE running the setup function.
source ~/.config/nvim/nvim-tree.vim

lua << EOF
require('moonfly_conf')
require('nvim-web-devicons')
require('nvim-tree_conf')
require('barbar_conf')
require('lualine_conf')
require('lspinstall_conf')
require('lspkind_conf')
require('nvim-cmp_conf')
require('telescope_conf')
require('treesitter_conf')
require('neoscroll_conf')
EOF

" default is already dark
" set background=dark
" highlight Normal guibg=none

source ~/.config/nvim/remap.vim

" https://vi.stackexchange.com/questions/678/how-do-i-save-a-file-in-a-directory-that-does-not-yet-exist
augroup Mkdir
    autocmd!
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

" https://stackoverflow.com/questions/630884/opening-vim-help-in-a-vertical-split-window
autocmd FileType help wincmd L

" https://www.reddit.com/r/vim/comments/jcecyb/vims_background_turns_opaque_in_new_windows/
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg
