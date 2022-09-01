local vim = vim
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({function(use)

    -- https://github.com/wbthomason/packer.nvim
    use 'wbthomason/packer.nvim'

    -- Github Co-pilot
    use 'github/copilot.vim'

    -- Display better lsp diagnostics with virtual lines below
    use { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim', config = require('lsp_lines_conf') }

    -- Highlight assistance for search result
    use 'kevinhwang91/nvim-hlslens'

    -- Smooth Scrolling
    use { 'karb94/neoscroll.nvim', config = require('neoscroll').setup() }

    -- camelCase and snake_case handling
    use 'chaoren/vim-wordmotion'

    -- Git
    -- TODO: maybe there's a better nvim version out there
    use 'tpope/vim-fugitive'

    -- lsp-kind
    use { 'onsails/lspkind-nvim', config = require('lspkind') }

    -- Debugger Adapter Protocol
    -- use 'mfussenegger/nvim-dap'
    -- use 'Pocco81/DAPInstall.nvim'

    -- Fancy Scroll Bar
    use { 'petertriho/nvim-scrollbar', config = {
        require('scrollbar').setup(),
        require('scrollbar.handlers.search').setup(),
    }}

    -- Auto save
    -- TODO: change to main branch when it gets stable
    use { 'Pocco81/AutoSave.nvim', config = require('auto-save').setup() }

    -- Project management
    -- TODO: maybe there's a better nvim version out there
    use { 'ahmedkhalf/project.nvim', config = require('project_conf') }

    -- Indent guide lines
    use { 'lukas-reineke/indent-blankline.nvim', config = require('indent-blankline_conf') }

    -- go to last cursor position
    -- TODO: write your own
    use 'farmergreg/vim-lastplace'

    -- https://draculatheme.com/vim
    use 'dracula/vim'

    -- https://github.com/lewis6991/gitsigns.nvim
    use { 'lewis6991/gitsigns.nvim', config = require('gitsigns').setup() }

    -- https://github.com/SmiteshP/nvim-navic
    use 'SmiteshP/nvim-navic'

    -- lualine
    use { 'nvim-lualine/lualine.nvim', config = require('lualine_conf') }

    -- dev icons
    use { 'kyazdani42/nvim-web-devicons' }
    -- use 'ryanoasis/vim-devicons'

    -- lsp-kind
    use 'onsails/lspkind-nvim'

    -- Telescope stuff
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope.nvim', config = require('telescope_conf') }
    use 'nvim-telescope/telescope-fzy-native.nvim'

    use {'williamboman/mason.nvim', config = require('mason').setup() }
    use { 'williamboman/mason-lspconfig.nvim', config = require('mason-lspconfig').setup() }
    use 'neovim/nvim-lspconfig'

    -- Live status update for LSP
    use 'nvim-lua/lsp-status.nvim'

    -- TreeSitter stuff
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = require('treesitter_conf') }
    use { 'nvim-treesitter/nvim-treesitter-refactor', config = require('treesitter-refactor_conf') }
    use { 'p00f/nvim-ts-rainbow', config = require('nvim-ts-rainbow_conf') }
    use 'nvim-treesitter/playground'
    use { 'simrat39/symbols-outline.nvim', config = require("symbols-outline").setup() }
    use { 'ziontee113/syntax-tree-surfer' , config = require('syntax-tree-surfer').setup() }

    -- Nvim-cmp
    use { 'hrsh7th/nvim-cmp', config = require('nvim-cmp_conf') }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-calc'
    use 'mtoohey31/cmp-fish'
    use 'ray-x/cmp-treesitter'
    use 'hrsh7th/cmp-copilot'

    -- Snippets
    use { 'dcampos/nvim-snippy', config = require('snippy').setup }
    use 'honza/vim-snippets'
    use 'dcampos/cmp-snippy'

    -- File Tree
    use { 'kyazdani42/nvim-tree.lua', config = require('nvim-tree_conf') }

    if packer_bootstrap then
        require('packer').sync()
    end
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end
    }
}})
