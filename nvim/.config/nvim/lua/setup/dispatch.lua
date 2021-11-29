-- Binds and autocommands for dispatch.vim

vim.cmd([[
    augroup setDispatch
        autocmd!
        autocmd FileType cpp let b:dispatch = "g++ -o debug/main -g %"
        autocmd FileType c let b:dispatch = "gcc -o debug/main -g %"
        autocmd FileType java let b:dispatch = "javac %"
        autocmd FileType python let b:dispatch = "python3 %"
        autocmd FileType go let b:dispatch = "go build"
        autocmd FileType typescript let b:dispatch = "yarn build"
    augroup end
]])
