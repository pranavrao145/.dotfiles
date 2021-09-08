syntax on 

set exrc
set tabstop=4 softtabstop=4
set shiftwidth=4 
set expandtab
set smartindent
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
set guicursor=
set colorcolumn=80
set backspace=indent,eol,start
set lazyredraw           
set ignorecase smartcase
set regexpengine=0
set diffopt+=vertical
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set noshowmode
set background=dark
set guifont=JetBrainsMono\ Nerd\ Font:h22

filetype plugin indent on

call plug#begin('~/.config/nvim/plugins')
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
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
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-dispatch'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-repeat'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mbbill/undotree'
Plug 'tpope/vim-abolish'
Plug 'vim-test/vim-test'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
call plug#end()

colorscheme gruvbox

let g:user_emmet_mode='a'
let g:VM_show_warnings = 0
let mapleader=' ' 
let g:vimspector_enable_mappings = 'HUMAN'
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:UltiSnipsEditSplit="vertical"
let g:netrw_http_cmd="brave"
let g:NERDSpaceDelims = 1

" Vim Fugitive setup
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gB :Git blame<cr>
nnoremap <leader>ds :Gdiffsplit<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gl :Git log<CR>

" Git worktree setup
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>ga <:lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

" Miscellaneous remaps
nnoremap <leader>s :w<CR>
nnoremap <leader>ss :w <bar> :bd<CR>
nnoremap <leader>S :w<CR>
nnoremap <leader>SS :w <bar> :bd<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>sa gg <bar> V <bar> G<CR>

function! ToggleQuickfixList()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

function! ToggleLocationList()
    if empty(filter(getwininfo(), 'v:val.loclist'))
        lopen
    else
        lclose
    endif
endfunction

"quickfix list remaps
nnoremap <C-q> :call ToggleQuickfixList()<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

"location list remaps
nnoremap <leader>q :call ToggleLocationList()<CR>
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprev<CR>

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

"rails remaps
nnoremap <leader>rc :Econtroller<CR>
nnoremap <leader>rv :Eview<CR>
nnoremap <leader>rm :Emodel<CR>

"Vimspector remaps
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

"Greatest remap ever
vnoremap <leader>p "_dP

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
hi LineNr guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi CursorLineNr guibg=NONE ctermbg=NONE

lua <<EOF
  local cmp = require'cmp'
  cmp.setup({
    sources = {
      { name = 'buffer' },
      { name = 'nvim_lsp' },
      { name = 'ultisnips' },
      { name = 'path' },
      { name = 'calc' },
    },
    formatting = {
      format = function(entry, vim_item)
        -- fancy icons and a name of kind
        vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

        -- set a name for each source
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          ultisnips = "[UltiSnips]",
        })[entry.source.name]
        return vim_item
      end,
    },
  })
EOF

" remaps to make tab for autocomplete work
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" visual mode next result
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

set completeopt=menuone,noselect

" easier search shortcut
nnoremap <leader>f /\<\><left><left>
nnoremap <leader>ff /\<<C-r><C-w>\>/g<CR>
nnoremap <leader>fr :%s/\<\>//g<left><left><left><left><left>
nnoremap <leader>frr :%s/\<<C-r><C-w>\>//g<left><left>

" telescope remaps
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gv <cmd>Telescope git_bcommits<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gg <cmd>Telescope live_grep<cr>
nnoremap <leader>fg <cmd>Telescope grep_string<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>ls <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>H <cmd>Telescope help_tags<cr>
nnoremap <leader>P <cmd>Telescope project<cr>

lua << EOF
require("git-worktree").setup{}
EOF

" lua for telescope initialization
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
                ["<C-q>"] = require("telescope.actions").smart_send_to_qflist,
                },
            n = {
                ["<C-q>"] = require("telescope.actions").smart_send_to_qflist,
                ["<C-a>"] = require("telescope.actions").select_all,
                ["<C-s>"] = require("telescope.actions").toggle_selection,
                ["<C-d>"] = require("telescope.actions").drop_all,
                },
            },
        only_sort_text = true,
        color_devicons= true,
        layout_config = {
            height = 0.7
            }
        },

    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
            }
        }
    }

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('project')
require("telescope").load_extension("git_worktree")
EOF

lua << EOF
local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>gy', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', "<leader>fm", '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "tsserver", "clangd", "pyright", "solargraph", "gopls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
      },
    capabilities = capabilities
  }
end
EOF

lua << EOF
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,
})

EOF

lua << EOF
require('lualine').setup({
    options = {
        theme = 'gruvbox'
    },
extensions = {
    'quickfix',
    'fugitive',
    }
})
EOF

lua << EOF
require("bufferline").setup{
    options = {
        diagnostics = "nvim_lsp"
        }
}
EOF

" harpoon remaps
 
lua << EOF
require("harpoon").setup{
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
    };
}
EOF


nnoremap <silent>'' :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>h :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent>'a :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent>'s :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent>'d :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent>'f :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent>'g :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <silent>'h :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <silent>'j :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <silent>'k :lua require("harpoon.ui").nav_file(8)<CR>
nnoremap <silent>'l :lua require("harpoon.ui").nav_file(9)<CR>
nnoremap <silent>'; :lua require("harpoon.ui").nav_file(10)<CR>

nnoremap <silent>'t :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>t :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>T :lua require("harpoon.term").gotoTerminal(3)<CR>

" exit terminal mode remaps
tnoremap kj <C-\><C-n> 
tnoremap KJ <C-\><C-n> 
tnoremap jk <C-\><C-n>
tnoremap JK <C-\><C-n>

" vim-test remaps
nmap <C-t>n :TestNearest<CR>
nmap <C-t>f :TestFile<CR>
nmap <C-t>s :TestSuite<CR>
nmap <C-t>l :TestLast<CR>
nmap <C-t>v :TestVisit<CR>

" command to copy the entire buffer name to the clipboard
command! CopyBuffer let @+ = expand('%:p')

" vim, behave or else
nnoremap Y y$

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" copy to clipboard bind
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" vim, behave or else: the sequel
nnoremap <expr> k (v:count > 2 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 2 ? "m'" . v:count : "") . 'j'

" undotree plugin
nnoremap <leader>u :UndotreeToggle<CR>

augroup setDispatch
    autocmd!
    autocmd FileType cpp let b:dispatch = "g++ -o debug/main -g %"
augroup end

augroup treesitter
    autocmd!
    autocmd FileType vim TSBufDisable highlight
augroup end

augroup lsp
    autocmd!
    autocmd FileType java lua require('setup_jdtls').setup()
augroup end

augroup nerdcommenter
    autocmd!
    autocmd FileType python let g:NERDSpaceDelims = 0
augroup end
