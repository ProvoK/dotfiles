" Plugin manager: vim-plug

call plug#begin('~/.local/share/nvim/plugged')

" Common
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go'
Plug 'terryma/vim-multiple-cursors'
Plug 'ctrlpvim/ctrlp.vim'           " CtrlP is installed to support tag finding in vim-go
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
Plug 'jeffkreeftmeijer/vim-numbertoggle'


" Language support
Plug 'lifepillar/pgsql.vim'         " PostgreSQL syntax highlighting
Plug 'fatih/vim-go'                 " Golang support
Plug 'sebdah/vim-delve'             " Golang debugger

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" -------------------------------------------------------------------------
" ---- GENERAL
" -------------------------------------------------------------------------
let mapleader = ','


set autoindent                    " take indent for new line from previous line
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set completeopt-=preview          " remove the horrendous preview window
set cursorline                    " highlight the current line for the cursor
set noerrorbells                  " No bells!
set noswapfile                    " disable swapfile usage
set novisualbell                  " I said, no bells!
set smartindent                   " enable smart indentation
set number		"Display line numbers
set ruler		"Display cursor position
set ignorecase

" Colorscheme
set background=dark
colorscheme PaperColor

" Font settings
set guifont=Monaco:h13

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e
set title

" Enable mouse if possible
if has('mouse')
    set mouse=a
endif

" Allow vim to set a custom font or color for a word
syntax enable

noremap <leader>t :NERDTreeToggle<CR>

" Golang

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gd <Plug>(go-def)

let g:deoplete#enable_at_startup = 1

" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "snakecase"

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1


" Fix some common typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"----------------------------------------------
" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitbelow
set splitright

" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Closing splits
nnoremap <leader>q :close<cr>

"----------------------------------------------
" Plugin: 'ctrlpvim/ctrlp.vim'
"----------------------------------------------
" Note: We are not using CtrlP much in this configuration. But vim-go depend on
" it to run GoDecls(Dir).

" Disable the CtrlP mapping, since we want to use FZF instead for <c-p>.
let g:ctrlp_map = ''

"----------------------------------------------
" Plugin: 'junegunn/fzf.vim'
"----------------------------------------------
nnoremap <c-p> :FZF<cr>

