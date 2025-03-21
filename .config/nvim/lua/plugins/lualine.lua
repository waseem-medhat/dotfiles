local opts = {
    options = {
        disabled_filetypes = { 'NvimTree' },
        icons_enabled = true,
        theme = 'horizon',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {},
        lualine_y = {
            {
                'location',
                padding = { left = 0, right = 1 },
            }
        },
        lualine_z = {},
    }
}

return {
    'nvim-lualine/lualine.nvim',
    opts = opts
}
