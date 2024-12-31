vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
            'folke/neodev.nvim',
        }
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'rafamadriz/friendly-snippets',
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')
                vim.keymap.set('n', '<leader>hp', function() gitsigns.nav_hunk('next') end,
                    { buffer = bufnr, desc = '[H]unks: go to [P]revious' })
                vim.keymap.set('n', '<leader>hn', function() gitsigns.nav_hunk('prev') end,
                    { buffer = bufnr, desc = '[H]unks: go to [N]ext' })
                vim.keymap.set('n', '<leader>hl', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = '[H]unks: [L]ook at (preview) hunk' })
            end,
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    { 'numToStr/Comment.nvim', opts = {} },
    {
        'fatih/vim-go',
        config = function()
            vim.g.go_doc_keywordprg_enabled = 0
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    'nvim-lualine/lualine.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'tpope/vim-surround',
    'christoomey/vim-tmux-navigator',
    { 'folke/which-key.nvim',  opts = {} },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            keymaps = { ["<BS>"] = { "actions.parent", mode = "n" } }
        },
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
    }
}, {})

require('waseem.options')
require('waseem.remap')

require('plugins.cmp')
require('plugins.lsp')
require('plugins.telescope')
require('plugins.theme')
require('plugins.treesitter')
