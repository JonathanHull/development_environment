" pathogen"
execute pathogen#infect()
execute pathogen#helptags()
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
colorscheme jonathan

set showcmd
set showmatch
set ignorecase
set hidden
set mouse=a
set t_Co=256

" Enable copy/paste between vim - system clipboard
vnoremap <C-y> "+yi<ESC><cr>
imap <C-p> <ESC>"+p<cr>


" Vim session options.
set ssop-=options " Do not store global/local values in a session
set ssop-=fields  " Do not store folds
let g:session_autoload = 'no' " dissable vim-session start dialog
let g:session_autosave = 'yes' " Enable vim-session autosaving

" Disable shell commands
set exrc
set secure

" Set senatic completion for youcompleteme
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_max_diagnostics_to_display = 333
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_disable_for_files_larger_than_kb=5000
" Gutter
set signcolumn=auto

" Enable gopls go semantic error checker 
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" vim-gitgutter
set updatetime=100
map  <silent> <C-g> :GitGutterToggle<CR>
imap <silent> <C-g> :GitGutterToggle<CR>
let g:gitgutter_enabled = 0

" nvimr
let R_setwidth = 0
let R_clear_line = 0

" vim-cpp-enhanced-highlight optional settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" DoxygenToolKit settings
let g:DoxygenToolKit_authorName="Jonathan Hull"
let g:DoxygenToolKit_blockHeader="@Synopsis  "
let g:DoxygenToolKit_blockHeader="@Param  "
let g:DoxygenToolKit_blockHeader="@Returns  "
let g:DoxygenToolKit_blockHeader="----------------------------------------------------------------------------"
let g:DoxygenToolKit_blockFooter="----------------------------------------------------------------------------"

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

" emmet keybinds -- HTML django
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
au BufNewFile,BufRead *.html set filetype=htmldjango
"let g:user_emmet_expandabbr_key='<Tab>'
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


" Vim bindings
" Toggle relative number.
map <C-x> :set rnu! rnu?<cr>
imap <C-x> <C-O>:set rnu! rnu?<CR>

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
" List buffers
map <silent><F4> :buffers<CR>:buffer<Space>

" Terminal shortcut
map <silent><F3> :terminal<CR>
" Do not add Terminals to buffers
augroup termIgnore
    autocmd!
    autocmd TerminalOpen * set nobuflisted
augroup END

" Cycle through buffers
map <PageUp> :bprevious<CR>
map <PageDown> :bnext<CR>

 
" Toggle spell mode.
map <F10> :set spell! spell?<cr>
imap <F10> <C-O>:set spell! spell?<cr>

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
command E execute "e"

"" Source files
" Airline config source file
so ~/.vim/source/vim-airline.vim
set guifont=DejaVu\ Sans:s12

" Source vim scripts
so ~/.vim/scripts/bclose.vim

"" Tmux rename window to vim
"autocmd VimEnter, VimLeave * silent !tmux set status
"
"" Tmux hide window when vim runs
let s:tmuxToggle=1
autocmd VimEnter * silent ! tmux set status off
autocmd VimLeave * silent ! tmux set status on

command! TM call ToggleTmux()
function! ToggleTmux()
    if s:tmuxToggle
        map <silent><F12> :! tmux set status off<CR>
        let s:tmuxToggle = 0
    else
        map <silent><F12> :! tmus set status on<CR>
        let s:tmuxToggle = 1
    endif
    let s:tmuxToggle = !s:tmuxToggle
endfunction
