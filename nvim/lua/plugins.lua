-- speed up load time
require('impatient')

local vim = vim
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({ function(use)

    -- https://github.com/lewis6991/impatient.nvim
    use 'lewis6991/impatient.nvim'

    -- https://github.com/wbthomason/packer.nvim
    use 'wbthomason/packer.nvim'

    -- Github Co-pilot
    use 'github/copilot.vim'

    -- Display better lsp diagnostics with virtual lines below
    use { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim', config = function()
        require('lsp_lines_conf')
    end }

    -- Git
    -- TODO: maybe there's a better nvim version out there
    use 'tpope/vim-fugitive'

    -- lsp-kind
    use 'onsails/lspkind-nvim'

    -- https://github.com/numToStr/Comment.nvim
    use { 'numToStr/Comment.nvim', config = function()
        require('Comment').setup()
    end }

    -- Debugger Adapter Protocol
    -- use 'mfussenegger/nvim-dap'
    -- use 'Pocco81/DAPInstall.nvim'

    -- Project management
    -- TODO: maybe there's a better nvim version out there
    use { 'ahmedkhalf/project.nvim', config = function()
        require('project_conf')
    end }

    -- Indent guide lines
    use { 'lukas-reineke/indent-blankline.nvim', config = function()
        require('indent-blankline_conf')
    end }

    -- go to last cursor position
    -- TODO: write your own
    use 'farmergreg/vim-lastplace'

    -- https://draculatheme.com/vim
    -- use 'dracula/vim'

    --https://github.com/Mofiqul/dracula.nvim
    use 'Mofiqul/dracula.nvim'

    -- https://github.com/xiyaowong/nvim-transparent
    use { 'xiyaowong/nvim-transparent', config = function()
        require("transparent").setup { enable = true }
    end }

    -- https://github.com/lewis6991/gitsigns.nvim
    use { 'lewis6991/gitsigns.nvim', config = function()
        require('gitsigns').setup()
    end }

    -- https://github.com/SmiteshP/nvim-navic
    use 'SmiteshP/nvim-navic'

    -- lualine
    use { 'nvim-lualine/lualine.nvim', config = function()
        require('lualine_conf')
    end }

    -- dev icons
    use { 'kyazdani42/nvim-web-devicons' }
    -- use 'ryanoasis/vim-devicons'

    -- Telescope stuff
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope.nvim', config = function()
        require('telescope_conf')
    end }
    -- use 'nvim-telescope/telescope-fzy-native.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use { 'williamboman/mason.nvim', config = function()
        require('mason').setup()
    end }
    use { 'williamboman/mason-lspconfig.nvim', config = function()
        require('mason-lspconfig').setup()
    end }
    use 'neovim/nvim-lspconfig'

    -- Live status update for LSP
    use 'nvim-lua/lsp-status.nvim'

    -- TreeSitter stuff
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
        require('treesitter_conf')
    end }
    use { 'nvim-treesitter/nvim-treesitter-refactor', config = function()
        require('treesitter-refactor_conf')
    end }
    use { 'p00f/nvim-ts-rainbow', config = function()
        require('nvim-ts-rainbow_conf')
    end }
    use { 'simrat39/symbols-outline.nvim', config = function()
        require("symbols-outline").setup()
    end }

    -- Nvim-cmp
    use { 'hrsh7th/nvim-cmp', config = function()
        require('nvim-cmp_conf')
    end }
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

    use 'dcampos/nvim-snippy'
    use 'honza/vim-snippets'
    use 'dcampos/cmp-snippy'

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
    } })
