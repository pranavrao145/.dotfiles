-- Binds and autocommands for dispatch.vim

vim.cmd([[
    augroup setDispatch
        autocmd!
        autocmd FileType cpp let b:dispatch = "g++ -o debug/main -g %"
        autocmd FileType go let b:dispatch = "go build"
    augroup end
]])