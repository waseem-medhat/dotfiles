---@module 'oil'
---@type oil.SetupOpts
local opts = {
    keymaps = {
        ["<BS>"] = { "actions.parent", mode = "n" },
        ["<C-h>"] = false
    },
    view_options = {
        show_hidden = true,
    }
}

local config = function()
    require("oil").setup(opts)
    vim.keymap.set('n', '<leader>b', ':Oil<Enter>', { desc = '[B]rowse files' })
end

return {
    'stevearc/oil.nvim',
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = config
}
