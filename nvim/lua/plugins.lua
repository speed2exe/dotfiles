local vim = vim
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'
        use 'github/copilot.vim'
        use { "folke/which-key.nvim", config = function()
            require('which-key').setup()
        end }
        use 'm00qek/baleia.nvim'
        use 'onsails/lspkind-nvim'
        use { 'numToStr/Comment.nvim', config = function()
            require('Comment').setup()
        end }
        use { 'ahmedkhalf/project.nvim', config = function()
            require('project_nvim').setup()
        end }
        use { 'lukas-reineke/indent-blankline.nvim', config = function()
            require('indent-blankline_conf') -- ~/.config/nvim/lua/indent-blankline_conf.lua
        end }
        use { 'ethanholz/nvim-lastplace', config = function()
            require('nvim-lastplace').setup()
        end }
        use 'dracula/vim'
        use { 'lewis6991/gitsigns.nvim', config = function()
            require('gitsigns').setup()
        end }
        use 'SmiteshP/nvim-navic'
        use { 'nvim-lualine/lualine.nvim', config = function()
            require('lualine_conf') -- ~/.config/nvim/lua/lualine_conf.lua
        end }
        use { 'nvim-tree/nvim-web-devicons', config = function()
            require('nvim-web-devicons').setup()
        end }
        use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
        use 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim'

        -- Telescope stuff
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use { 'nvim-telescope/telescope.nvim', config = function()
            require('telescope_conf') -- ~/.config/nvim/lua/telescope_conf.lua
        end }
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        use 'nvim-telescope/telescope-file-browser.nvim'

        -- LSP stuff
        use { 'williamboman/mason.nvim', config = function()
            require('mason').setup()
        end }
        use { 'williamboman/mason-lspconfig.nvim', config = function()
            require('mason-lspconfig').setup()
        end }
        use 'neovim/nvim-lspconfig'
        use 'nvim-lua/lsp-status.nvim'

        -- TreeSitter stuff
        use { 'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
            config = function()
                require('treesitter_conf') -- ~/.config/nvim/lua/treesitter_conf.lua
            end }
        use { 'nvim-treesitter/nvim-treesitter-context', config = function()
            require('treesitter-context').setup()
        end }

        -- Completion stuff
        use { 'hrsh7th/nvim-cmp', config = function()
            require('nvim-cmp_conf') -- ~/.config/nvim/lua/nvim-cmp_conf.lua
        end }
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-nvim-lsp-signature-help'
        use 'hrsh7th/cmp-nvim-lsp-document-symbol'
        use 'hrsh7th/cmp-nvim-lua'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'mtoohey31/cmp-fish'
        use 'ray-x/cmp-treesitter'
        use 'dcampos/nvim-snippy'
        use 'dcampos/cmp-snippy'

        -- language specific stuff
        use { 'simrat39/rust-tools.nvim',
        requires = { 'williamboman/mason.nvim' },
        config = function()
            require('rust-tools').setup()
        end }
        use { 'Saecki/crates.nvim', config = function()
            require('crates').setup()
        end }
        use { 'akinsho/flutter-tools.nvim',
            requires = { 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' },
            config = function() require('flutter-tools').setup() end
        }

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
    }
})
