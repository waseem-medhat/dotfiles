local config = function ()
    vim.cmd.colorscheme "kanagawa"
end

return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = config
}
