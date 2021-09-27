-- Setup NERDCommenter for commenting

vim.cmd('let g:NERDSpaceDelims = 1')

vim.cmd([[
    augroup nerdcommenter
        autocmd!
        autocmd FileType python let g:NERDSpaceDelims = 0
    augroup end
]])
