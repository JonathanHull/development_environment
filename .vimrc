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

set ssop-=options " Do not store global/local values in a session
set ssop-=fields  " Do not store folds
let g:session_autoload = 'no' " dissable vim-session start dialog
let g:session_autosave = 'yes' " Enable vim-session autosaving

" Disable shell commands
set exrc
set secure

" Set senatic completion for youcompleteme
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
let g:ycm_max_diagnostics_to_display = 333

" vim-cpp-enhanced-highlight optional settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

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
imap <C-x> <Esc>:set rnu! rnu?<CR>

" Bind Control-S to save file.
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

" CommandT bindings
nnoremap <C-t><C-f> :CommandT<CR>
nnoremap <C-t><C-b> :CommandTBuffer<CR>
nnoremap <C-t><C-r> :CommandTCommand<CR>

" Toggle NerdTree
map <silent><F5> :NERDTreeToggle <cr>
 
" Toggle spell mode.
map <F10> :set spell! spell?<cr>

" Change default .tex file syntax detection to latex.
let g:tex_flavor="latex"

" set vimtex settings
let g:vimtex_view_method = 'mupdf'

" Set Vim to scroll multiple lines per tick.
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Typo fixes
command Q execute "quit"
command Wq execute "wq"
command WQ execute "wq"

" Airline config source file
so ~/.vim/source/vim-airline.vim
set guifont=DejaVu\ Sans:s12

"" Tmux rename window to vim
"autocmd VimEnter, VimLeave * silent !tmux set status
"
"" Tmux hide window when vim runs
autocmd VimEnter * silent ! tmux set status off
autocmd VimLeave * silent ! tmux set status on
