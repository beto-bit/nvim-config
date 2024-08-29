return {
    {
        'arithran/vim-delete-hidden-buffers',
        lazy = true,
        init = function() vim.cmd 'au TabEnter,TabLeave * : DeleteHiddenBuffers' end
    }
}
