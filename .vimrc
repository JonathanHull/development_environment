" pathogen"
execute pathogen#infect()
syntax on
filetype plugin indent on

"Map leader \ key to space"
let mapleader = "\<Space>"

set encoding=utf-8

set number
set textwidth=80
set wrapmargin=2
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set ruler
set backspace=indent,eol,start 
colorscheme desert

set showcmd
set showmatch
set ignorecase
set hidden
set mouse=a
set t_Co=256

" Store buffers after closing vim.
set viminfo=%,<800,'10,/50

" Pleb unbinds
inoremap <Up> <nop>
inoremap <Down> <nop>	
inoremap <Right> <nop>	
inoremap <Left> <nop>

" Vim bindings
map <C-x> :set rnu! rnu?<cr>

" Change default .tex file syntax detection to latex.
let g:tex_flavor="latex"

" Set Vim to scroll multiple lines per tick.
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Airline config source file
so ~/.config/.vim/source/vim-airline.vim
set guifont=DejaVu\ Sans:s12
