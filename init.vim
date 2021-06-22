syntax on

set exrc
set tabstop=4 softtabstop=4
set shiftwidth=4 
set expandtab
set smartindent
set guicursor=
set nohlsearch
set hidden
set noerrorbells
set nu
set relativenumber
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors 
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set backspace=indent,eol,start
set lazyredraw           
set ignorecase smartcase
set regexpengine=0
set diffopt+=vertical
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

filetype plugin on
filetype indent on

call plug#begin('~/.config/nvim/plugins')
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mattn/emmet-vim'
Plug 'craigemery/vim-autotag'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-rails'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-bundler'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-surround'
Plug 'puremourning/vimspector'
Plug 'ryanoasis/vim-devicons'
Plug 'andweeb/presence.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } 
Plug 'rafi/awesome-vim-colorschemes'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

colorscheme palenight

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts=1
let g:user_emmet_mode='a'
let g:far#enable_undo=1
let g:user_emmet_leader_key=','
let g:VM_show_warnings = 0
let mapleader=' ' 
let g:vimspector_enable_mappings = 'HUMAN'

" Vim Fugitive setup
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>ds :Gdiffsplit<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>

" Miscellaneous remaps
nnoremap <leader>s :w<CR>
nnoremap <leader>ss :w <bar> :bd<CR>
nnoremap <leader>S :w<CR>
nnoremap <leader>SS :w <bar> :bd<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>sa gg <bar> V <bar> G<CR>

"quickfix list remaps
nnoremap <C-q> :copen<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

"location list remaps
nnoremap <leader>q :lopen<CR>
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprev<CR>
nnoremap <leader>lp :CocDiagnostic<CR>

"Vim maximizer remap
nnoremap <leader>m :MaximizerToggle!<CR>

" semicolon remaps
nnoremap ; :
nnoremap : ;
vnoremap ; : 
vnoremap : ;

" exit insert mode remaps
inoremap kj <Esc>
inoremap KJ <Esc>
inoremap jk <Esc>
inoremap JK <Esc>

" coc remaps
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>rf <Plug>(coc-refactor)
nmap <silent>]g <Plug>(coc-diagnostic-next)
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <C-t> <Plug>(coc-terminal-toggle)
nmap <leader>aa <Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected) 
xmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)

"rails remaps
nnoremap <leader>rc :Econtroller<CR>
nnoremap <leader>rv :Eview<CR>
nnoremap <leader>rm :Emodel<CR>

"Vimspector remaps
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

"Greatest remap ever
vnoremap <leader>p "_dP

"to show inline documentation
nnoremap <silent>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction 

" treesitter activation
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
highlight = {
enable = true,              -- false will disable the whole extension
},
}
EOF

hi Normal guibg=NONE ctermbg=NONE

" remaps to make tab for autocomplete work
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" easier search shortcut
nnoremap <leader>f /\<\><left><left>
nnoremap <leader>fr :%s/\<\>/<left><left><left>

" telescope remaps
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>gc <cmd>Telescope git_branches<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

lua <<EOF
require('telescope').setup {
    defaults = {
        file_sorter =  require'telescope.sorters'.get_fzy_sorter,
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            },
        mappings = {
            i = {
                ["<C-q>"] = require("telescope.actions").send_to_qflist,
                },
            },
        preview_cutoff = 1
        },

    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
            }
        }
    }

require('telescope').load_extension('fzy_native')

local M = {}

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end

return M
EOF

