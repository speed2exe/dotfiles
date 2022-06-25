call plug#begin('~/.vim/plugged')

" Github Co-pilot
"Plug 'github/copilot.vim'

" Blink Cursor
Plug 'danilamihailov/beacon.nvim'

" Auto complete braces
Plug 'windwp/nvim-autopairs'

" Smooth Scrolling
Plug 'karb94/neoscroll.nvim'

" camelcase and snake case handling
Plug 'chaoren/vim-wordmotion'

" Git
Plug 'tpope/vim-fugitive'

" Display LSP stuff nicer
Plug 'folke/trouble.nvim'

" Lspsaga
" Plug 'glepnir/lspsaga.nvim'
Plug 'tami5/lspsaga.nvim'

" TreeSitter stuff
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/playground'
Plug 'simrat39/symbols-outline.nvim'
Plug 'ziontee113/syntax-tree-surfer'

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

" Debugger Adapter Protocol
" Plug 'mfussenegger/nvim-dap'
" Plug 'Pocco81/DAPInstall.nvim'

" Fancy Scroll Bar
Plug 'petertriho/nvim-scrollbar'

" Fancy highlight for search
Plug 'kevinhwang91/nvim-hlslens'

call plug#end()

if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    PlugInstall --sync | q
endif

lua << EOF
    require('lspsaga_conf')                 -- ~/.config/nvim/lua/lspsaga_conf.lua
    require('lspkind_conf')                 -- ~/.config/nvim/lua/lspkind_conf.lua
    require('nvim-cmp_conf')                -- ~/.config/nvim/lua/nvim-cmp_conf.lua
    require('treesitter-refactor_conf')     -- ~/.config/nvim/lua/treesitter-refactor_conf.lua
    require('neoscroll_conf')               -- ~/.config/nvim/lua/neoscroll_conf.lua
    -- require('dapinstall_conf')              -- ~/.config/nvim/lua/dapinstall_conf.lua
    require('scrollbar_conf')               -- ~/.config/nvim/lua/scrollbar_conf.lua
    require('snippy_conf')                  -- ~/.config/nvim/lua/snippy_conf.lua
    require('cmp_dictionary_conf')			-- ~/.config/nvim/lua/cmp_dictionary_conf.lua
    -- require('lsp-status_conf')              -- ~/.config/nvim/lua/lsp-status_conf.lua
    require('symbols-outline_conf')         -- ~/.config/nvim/lua/symbols-outline_conf.lua

    require('trouble').setup{}
    require('syntax-tree-surfer').setup{}
    require('nvim-autopairs').setup{}

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
