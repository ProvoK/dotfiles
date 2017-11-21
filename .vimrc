set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'
Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjbach/lusty'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/neocomplete'
Plugin 'scrooloose/nerdtree'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'easymotion/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Autowrite
set autowrite
" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Fix typos
cabbrev W write
cabbrev Q quit

" -- Display
set title		"Update title of terminal window
set number		"Display line numbers
set ruler		"Display cursor position
set wrap		"Wrap too long lines

set scrolloff=3 	"Display at least 3 lines around your cursor

set guioptions=T	"Enable toolbar

" -- Search
set ignorecase		"Ignore case when searching
set smartcase		"If there is an uppercase in your search term
			"search case sensitive again
set incsearch		"Highlight search results when typing
set hlsearch		"Highlight search results

" -- Beep
set visualbell		" Prevent Vim from beeping
set noerrorbells	" Idem

" Backspace behaves as expected
set backspace=indent,eol,start

" Hide buffer (file) instead of abandoning when switching
" to another buffer
set hidden

syntax enable

"Enable file specific behavior like syntax highlighting and indentation
filetype on
filetype indent on
filetype plugin on

" Color theme (Solarized Dark)
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "normal"
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" Font settings
set guifont=Monaco:h13
set antialias

" NERDTree auto open
" autocmd vimenter * NERDTree

" REMAPS
""split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" nerdtree toggle
nnoremap <C-T> :NERDTreeToggle<CR>

"" vim-go 
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

"" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

let mapleader = ","

" vim-go
let g:go_list_type = "quickfix"
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

" Status line settings
set laststatus=2
set showtabline=2
let g:airline#extensions#tabline#enabled = 1


" vim-session
let g:session_autoload = 'no'
let g:session_autosave = 'no'
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession
nnoremap <leader>sc :CloseSession

" python-mode
let g:pymode_options_max_line_length = 100
let g:pymode_lint_options_pylint =
        \ {'max-line-length': g:pymode_options_max_line_length}
let g:pymode_python = 'python3'
let g:pymode_rope_lookup_project = 0  " This is a test...for slowness
let g:pymode_rope = 0
let g:pymode_lint_checkers = ['pyflakes']
let g:pymode_lint_on_fly = 1

" easymotion
"" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

"" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

"" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

