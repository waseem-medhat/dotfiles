local buf_name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
local path = vim.fn.fnamemodify(string.sub(buf_name, 7), ":.")

if path == "" then
    path = "./"
end

vim.wo.winbar = "  " .. path
