local opts = {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')
        vim.keymap.set('n', '<leader>]h', function() gitsigns.nav_hunk('next') end,
            { buffer = bufnr, desc = '[H]unks: go to [P]revious' })
        vim.keymap.set('n', '<leader>[h', function() gitsigns.nav_hunk('prev') end,
            { buffer = bufnr, desc = '[H]unks: go to [N]ext' })
        vim.keymap.set('n', '<leader>hl', require('gitsigns').preview_hunk,
            { buffer = bufnr, desc = '[H]unks: [L]ook at (preview) hunk' })
    end,
}

return {
    'lewis6991/gitsigns.nvim',
    opts = opts
}
