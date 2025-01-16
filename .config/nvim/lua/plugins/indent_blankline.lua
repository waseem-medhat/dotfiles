---@module "ibl"
---@type ibl.config
local opts = {
    scope = { enabled = false },
    indent = { char = "" },
}

return {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = opts
}
