" This file is here, because it is easier to bundle all my
" VIM config all in the same folder.
" Please symlink it to ~/.vimrc
"

" Start Pathogen
call pathogen#infect()

" Add smart indentation
set smartindent

" Remap some keys to make window navigation less painful
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Make Y behave like other capitals
nnoremap Y y$

" Remap some common typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang

" Remap cut/copy/paste to the system clipboard to the standard Ctrl-[X,C,V]
" instead of this "+y / "+gp bullshit

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V> "+gP
map <S-Insert> "+gP

cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+


" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>


" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

if has("gui_running")
    let g:Powerline_symbols = 'fancy'
    syntax on
    " Color Scheme
    colorscheme solarized
    set gfn=Consolas_for_Powerline_FixedD:h11:cANSI
    au GUIEnter * simalt ~n
    set encoding=utf8
    " Set VIM to show non-printable characters
    set listchars=tab:\| ,trail:•,extends:»,precedes:«,nbsp:_
    set list
    " Remove toolbar and menubar
    set guioptions-=m
    set guioptions-=T
endif

" Look for local vim config files
if filereadable(".vim.custom")
    so .vim.custom
endif

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction

" Do not change CTRL-P's working dir
let g:ctrlp_working_path_mode = 0

" Filetype plugin
filetype plugin indent on

" Tabs -> spaces
set tabstop=4
set shiftwidth=4
set expandtab

map <F2> :NERDTreeToggle
nmap <F3> :TagbarToggle

" Ctrl-Tab and Ctrl-Shift-Tab
map <C-Tab> :BuffingWheelNext
map <C-s-Tab> :BuffingWheelPrevious
map <C-Right> :tabnext
map <C-Left> :tabprevious

map <C-p> :CtrlP

" MiniBufExpl Colors
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#000000 guibg=fg


" Perforce integration
if !exists("g:p4client")
    let g:p4client = "ecantin-IMS4.0.x"
endif
function P4Edit ()
    let command = "!p4 -c " . g:p4client . " edit " . bufname("%")
    execute command
endfunction

function P4Add ()
    let command = "!p4 -c " . g:p4client . " add " . bufname("%")
    execute command
endfunction

autocmd FileChangedRO * call P4Edit()

" Automatically sync NERDTree
autocmd BufWinEnter * NERDTreeMirror

" Set vim to update autmatically when a file's read-only state is changed
:set autoread
