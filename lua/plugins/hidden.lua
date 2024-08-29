return {
    {
        'arithran/vim-delete-hidden-buffers',
        init = function() vim.cmd 'au TabEnter,TabLeave * : DeleteHiddenBuffers' end
    }
}
