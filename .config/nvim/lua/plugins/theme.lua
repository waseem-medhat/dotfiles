vim.cmd.colorscheme "tokyonight-night"

require('lualine').setup({
    options = {
        disabled_filetypes = { 'NvimTree' },
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            {
                'mode',
                cond = nil,            -- Condition function, the component is loaded when the function returns `true`.
                draw_empty = false,    -- Whether to draw component even if it's empty.
                padding = 1,           -- Adds padding to the left and right of components.
                fmt = function(str, _) -- Format function, formats the component's output.
                    -- return " " .. str
                    return string.sub(str, 0, 1)
                end,
            }
        }
    }
})

require("ibl").setup {
    scope = { enabled = false },
    indent = { char = "" },
}
