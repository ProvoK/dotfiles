"  ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================

call plug#begin('~/.config/nvim/plugged')

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
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Language support
Plug 'lifepillar/pgsql.vim'         " PostgreSQL syntax highlighting
Plug 'fatih/vim-go'                 " Golang support
Plug 'sebdah/vim-delve'             " Golang debugger
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins', 'for': 'python' } " Python autocomplete
Plug 'davidhalter/jedi-vim', { 'for': 'python' }  " Python goto etc


" Colorschemes
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" -------------------------------------------------------------------------
" ---- GENERAL
" -------------------------------------------------------------------------

set shell=/bin/bash

let g:python3_host_prog = $HOME . '/.pyenv/versions/3.6.5/envs/neovim3/bin/python'
let g:python_host_prog = $HOME . '/.pyenv/versions/2.7.15/envs/neovim2/bin/python'


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

" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

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

"----------------------------------------------
" Plugin: 'w0rp/ale'
"----------------------------------------------
let g:ale_python_flake8_options = '--max-line-length=100'
let g:ale_python_pylint_options = '--max-line-length=100 --no-docstring-rgx=test'

"----------------------------------------------
" Plugin: 'sheerun/vim-polyglot'
"----------------------------------------------
let g:polyglot_disabled = ['md', 'markdown']

"----------------------------------------------
" Plugin: 'Shougo/neosnippet'
"----------------------------------------------

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
