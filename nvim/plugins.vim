" Automatically install missing plugins on startup
" https://github.com/junegunn/vim-plug/wiki/extra
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif


call plug#begin('~/.vim/plugged')

" Github Co-pilot
Plug 'github/copilot.vim'

" Project management
Plug 'ahmedkhalf/project.nvim'

" Fancy Start Screen
Plug 'mhinz/vim-startify'

" Blink Cursor
Plug 'danilamihailov/beacon.nvim'

" Auto complete braces
Plug 'windwp/nvim-autopairs'

" Auto save
Plug 'Pocco81/AutoSave.nvim'

" Indent guide lines
Plug 'lukas-reineke/indent-blankline.nvim'

" go to last cursor position
Plug 'farmergreg/vim-lastplace'

" Smooth Scrolling
Plug 'karb94/neoscroll.nvim'

" camelcase and snake case handling
Plug 'chaoren/vim-wordmotion'

" fzf search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" https://draculatheme.com/vim
Plug 'dracula/vim', {'as': 'dracula'}

" lualine
Plug 'nvim-lualine/lualine.nvim'

" dev icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" git
Plug 'tpope/vim-fugitive'
" https://github.com/lewis6991/gitsigns.nvim
Plug 'lewis6991/gitsigns.nvim'
"
" Plug 'mhinz/vim-signify'

" Telescope stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSP stuff
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
" Plug 'nvim-lua/lsp-status.nvim'

" https://github.com/SmiteshP/nvim-navic
Plug 'SmiteshP/nvim-navic'

" Display LSP stuff nicer
Plug 'folke/trouble.nvim'

" Lspsaga
" Plug 'glepnir/lspsaga.nvim'
Plug 'tami5/lspsaga.nvim'

" TreeSitter stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/playground'
Plug 'simrat39/symbols-outline.nvim'
Plug 'p00f/nvim-ts-rainbow'
" https://github.com/ziontee113/syntax-tree-surfer
Plug 'ziontee113/syntax-tree-surfer'

" nvim-tree
Plug 'kyazdani42/nvim-tree.lua'

" lsp-kind
Plug 'onsails/lspkind-nvim'

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
Plug 'hrsh7th/cmp-copilot'
Plug 'dmitmel/cmp-digraphs'
Plug 'uga-rosa/cmp-dictionary'
Plug 'mtoohey31/cmp-fish'
Plug 'ray-x/cmp-treesitter'

" snippets
Plug 'dcampos/nvim-snippy'
Plug 'honza/vim-snippets'
Plug 'dcampos/cmp-snippy'

" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'golang/vscode-go'

" Debugger Adapter Protocol
" Plug 'mfussenegger/nvim-dap'
" Plug 'Pocco81/DAPInstall.nvim'

" Fancy Scroll Bar
Plug 'petertriho/nvim-scrollbar'

" Fancy highlight for search
Plug 'kevinhwang91/nvim-hlslens'

call plug#end()

lua << EOF
    require('autosave_conf')                -- ~/.config/nvim/lua/autosave_conf.lua
    require('nvim-web-devicons')            -- ~/.config/nvim/lua/nvim-web-devicons_conf.lua
    require('nvim-tree_conf')               -- ~/.config/nvim/lua/nvim-tree_conf.lua
    require('lualine_conf')                 -- ~/.config/nvim/lua/lualine_conf.lua
    require('nvim-lsp-installer_conf')      -- ~/.config/nvim/lua/nvim-lsp-installer_conf.lua
    require('lspsaga_conf')                 -- ~/.config/nvim/lua/lspsaga_conf.lua
    require('lspkind_conf')                 -- ~/.config/nvim/lua/lspkind_conf.lua
    require('nvim-cmp_conf')                -- ~/.config/nvim/lua/nvim-cmp_conf.lua
    require('telescope_conf')               -- ~/.config/nvim/lua/telescope_conf.lua
    require('treesitter_conf')              -- ~/.config/nvim/lua/treesitter_conf.lua
    require('treesitter-refactor_conf')     -- ~/.config/nvim/lua/treesitter-refactor_conf.lua
    require('neoscroll_conf')               -- ~/.config/nvim/lua/neoscroll_conf.lua
    -- require('dapinstall_conf')              -- ~/.config/nvim/lua/dapinstall_conf.lua
    require('scrollbar_conf')               -- ~/.config/nvim/lua/scrollbar_conf.lua
    require('snippy_conf')                  -- ~/.config/nvim/lua/snippy_conf.lua
    require('project_conf')                 -- ~/.config/nvim/lua/project_conf.lua
    require('nvim-ts-rainbow_conf')         -- ~/.config/nvim/lua/nvim-ts-rainbow_conf.lua
    require('cmp_dictionary_conf')			-- ~/.config/nvim/lua/cmp_dictionary_conf.lua
    -- require('lsp-status_conf')              -- ~/.config/nvim/lua/lsp-status_conf.lua
    require('nvim-navic_conf')              -- ~/.config/nvim/lua/nvim-navic_conf.lua
    require('symbols-outline_conf')         -- ~/.config/nvim/lua/symbols-outline_conf.lua
    require('indent-blankline_conf')        -- ~/.config/nvim/lua/indent-blankline_conf.lua

    -- default setup
    require('trouble').setup{}
    require('syntax-tree-surfer').setup{}
    require('nvim-autopairs').setup{}
    require('gitsigns').setup{}

    -- custom plugin (self made)
    require('last_used')					-- ~/.config/nvim/lua/last_used.lua

EOF

" Statusline
" function! LspStatus() abort
"     if luaeval('#vim.lsp.buf_get_clients() > 0')
"         return luaeval("require('lsp-status').status()")
"     endif
" 
"     return ''
" endfunction

" https://github.com/kevinhwang91/nvim-hlslens
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>
