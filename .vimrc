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
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ruler
set backspace=indent,eol,start 
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
colorscheme desert

set showcmd
set showmatch
set ignorecase
set hidden
set mouse=a
set t_Co=256

" Disable shell commands
set exrc
set secure

" Set senatic completion for youcompleteme
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"

" enable doxygen highlighting
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END


" Store buffers after closing vim.
set viminfo=%,<800,'10,/50

" Pleb unbinds
inoremap <Up> <nop>
inoremap <Down> <nop>	
inoremap <Right> <nop>	
inoremap <Left> <nop>

" fugitive shortcuts
map <leader>gb :Gblame <cr>
map <leader>gd :Gdiff <cr>
map <leader>gs :Gstatus <cr>
map <leader>gl :Glog <cr>

" Vim bindings
" Toggle relative number.
map <C-x> :set rnu! rnu?<cr>
imap <C-x> <Esc>:set rnu! rnu?<CR>a

" Toggle NerdTree
map <F5> :NERDTreeToggle <cr>
 
" Toggle spell mode.
map <F10> :set spell! spell?<cr>

" Change default .tex file syntax detection to latex.
let g:tex_flavor="latex"

" Set Vim to scroll multiple lines per tick.
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Airline config source file
so ~/.vim/source/vim-airline.vim
set guifont=DejaVu\ Sans:s12
