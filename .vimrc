" This file is here, because it is easier to bundle all my
" VIM config all in the same folder.
" Please symlink it to ~/.vimrc
"

" Start Pathogen
call pathogen#infect()

" Add smart indentation
set smartindent

" set tabs
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

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

" Color Scheme (only if GUI running) {{{
if has("gui_running")
    colorscheme smyck
    set guifont=Menlo\ for\ Powerline
    let g:Powerline_symbols = 'fancy'
    set fillchars+=stl:\ ,stlnc:\
    set encoding=utf-8
endif
" set macvim specific stuff
if has("gui_macvim")
    set transparency=10
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

