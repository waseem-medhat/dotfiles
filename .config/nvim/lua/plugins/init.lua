return {
    {
        'fatih/vim-go',
        config = function()
            vim.g.go_doc_keywordprg_enabled = 0
        end
    },
    { 'folke/which-key.nvim', opts = {} },
    'tpope/vim-surround',
    'christoomey/vim-tmux-navigator',
}
