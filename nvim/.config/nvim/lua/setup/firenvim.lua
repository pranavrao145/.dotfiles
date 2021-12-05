vim.cmd([[
    let g:firenvim_config = { 
        \ 'localSettings': {
            \ '.*': {
                \ 'priority': 1,
                \ 'takeover': 'never',
            \ },
        \ }
    \ }
]])
