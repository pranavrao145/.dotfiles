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
set regexpengine=0
set ignorecase smartcase  
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
Plug 'tpope/vim-repeat'
Plug 'ryanoasis/vim-devicons'
Plug 'andweeb/presence.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'stsewd/fzf-checkout.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'rafi/awesome-vim-colorschemes'
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

nnoremap <leader>gs :G<CR>
nnoremap <leader>ds :Gdiffsplit<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>ss :w <bar> :bd<CR>
nnoremap <leader>S :w<CR>
nnoremap <leader>SS :w <bar> :bd<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>gc :GCheckout<CR>


nnoremap ; :
nnoremap : ;
vnoremap ; : 
vnoremap : ;

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

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>rf <Plug>(coc-refactor)
nmap <leader>np <Plug>(coc-diagnostic-next)
nmap <leader>pp <Plug>(coc-diagnostic-previous)
nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>t <Plug>(coc-terminal-toggle)

" codeaction selected
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected) 

" format selected
xmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)

" format whole file
nnoremap <leader>sa gg <bar> V <bar> G<CR>

nnoremap <C-p> :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

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

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

hi Normal guibg=NONE ctermbg=NONE

