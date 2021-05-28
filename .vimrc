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
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors 
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set backspace=indent,eol,start
set lazyredraw           
set regexpengine=1        
set ignorecase smartcase  
set diffopt+=vertical

filetype plugin on
filetype indent on

call plug#begin('~/.vim/vim-plugins')
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mattn/emmet-vim'
Plug 'craigemery/vim-autotag'
Plug 'brooth/far.vim'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-rails'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-bundler'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-surround'
Plug 'puremourning/vimspector'
call plug#end()

colorscheme palenight

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:user_emmet_mode='a'
let g:far#enable_undo=1
let g:user_emmet_leader_key=','
let g:VM_show_warnings = 0
let ayucolor="mirage"
let mapleader=' ' 
let g:gruvbox_guisp_fallback = 'bg'
let g:vimspector_enable_mappings = 'HUMAN'

nnoremap <leader>gs :G<CR>
nnoremap <leader>ds :Gdiffsplit!<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>ss :w <bar> :bd<CR>
nnoremap <leader>S :w<CR>
nnoremap <leader>SS :w <bar> :bd<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>t :CocCommand terminal.Toggle<CR>
nnoremap <leader>m :MaximizerToggle!<CR>

inoremap kj <Esc>
inoremap KJ <Esc>
inoremap jk <Esc>
inoremap JK <Esc>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" shortcut for far.vim find
nnoremap <silent> <Find-Shortcut>  :Farf<cr>
vnoremap <silent> <Find-Shortcut>  :Farf<cr>

nnoremap <leader>f :Farf<CR>
vnoremap <leader>f :Farf<CR>

" shortcut for far.vim replace
nnoremap <silent> <Replace-Shortcut>  :Farr<cr>
vnoremap <silent> <Replace-Shortcut>  :Farr<cr>

nnoremap <leader>fr :Farr<CR>
vnoremap <leader>fr :Farr<CR>

nnoremap <leader>gd <Plug>(coc-definition)
nnoremap <leader>gr <Plug>(coc-references)
nnoremap <silent>gi <Plug>(coc-implementation)
nnoremap <silent>gy <Plug>(coc-type-definition)

nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <leader>r :reg<CR>

"Vimspector remaps
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

