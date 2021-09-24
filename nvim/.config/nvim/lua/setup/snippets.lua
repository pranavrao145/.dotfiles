-- Set up UltiSnips for snippets

-- Options
vim.cmd([[
    let g:UltiSnipsExpandTrigger="<C-s>"
    let g:UltiSnipsJumpForwardTrigger="<C-f>"
    let g:UltiSnipsJumpBackwardTrigger="<C-b>"
    let g:UltiSnipsEditSplit="vertical"
]])

-- Autocmds to add certain snippets to certain filetypes
vim.cmd([[
    augroup snippets
        autocmd!
        autocmd BufEnter *.jsx UltiSnipsAddFiletypes html
        autocmd BufEnter *.jsx UltiSnipsAddFiletypes javascript
        autocmd BufEnter *.tsx UltiSnipsAddFiletypes html
        autocmd BufEnter *.tsx UltiSnipsAddFiletypes typescript
    augroup END
]])
