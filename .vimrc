" Activate pathogen
call pathogen#infect()
"VIM Configuration - Vittorio Camisa
set nocompatible

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
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256
colorscheme solarized

" Font settings
set guifont=Monaco:h13
set antialias

" NERDTree auto open
" autocmd vimenter * NERDTree

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

let mapleader = ","
