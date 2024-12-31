local conf_path = '/home/waseem/.config/nvim/'
local init_path = conf_path .. 'init.lua'

-- From kickstart
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- My remaps
vim.keymap.set('n', '<leader>rc', function() vim.cmd.edit(init_path) end, { desc = 'Edit vim[r][c]' })
vim.keymap.set('n', '<leader>wd', function() vim.cmd.cd("%:h") end,
    { desc = 'Set [w]orking [d]irectory to current file' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [k]eymaps' })
vim.keymap.set('n', '<C-s>', ':w<Enter>', { desc = 'Write/Save' })
vim.keymap.set('n', '<leader>sp', ':set spell!<Enter>', { desc = 'Toggle [sp]ell checking' })
vim.keymap.set('n', '<leader>lr', ':LspRestart<Enter>', { desc = '[L]SP [R]estart' })
vim.keymap.set('n', '<leader>ss', ':e /tmp/scratch<Enter>', { desc = '[S]tart a [S]cratch buffer (tmp file)' })
vim.keymap.set('n', '<leader>b', ':Oil --float<Enter>', { desc = '[B]rowse files' })
vim.keymap.set('i', '<C-s>', '<Esc>:w<Enter>a', { desc = 'Write/Save' })
