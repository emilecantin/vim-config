" This file is here, because it is easier to bundle all my
" VIM config all in the same folder.
" Please symlink or copy it to ~/.vimrc

" Vundle and bundles configuration:
"
" IMPORTANT: On first installation, most of this file will be broken. You need
" to install bundles by running the following command inside the vim directory:
"
" vim -u bundles.vim +BundleInstall +q
"
if (has('win32') || has('win64'))
	source $HOME/vimfiles/bundles.vim
else
	source $HOME/.vim/bundles.vim
endif

" ================================================================================
" VIM settings
" ================================================================================

" Basic setup
set nocompatible
syntax on
filetype plugin indent on
set encoding=utf8
" Add mouse support
set mouse=a

" Add smart indentation
set smartindent

" Indentation settings
set tabstop=2
set shiftwidth=2
set expandtab

" Set vim to update autmatically when a file's read-only state is changed
set autoread

" Set VIM to show non-printable characters
set listchars=tab:\| ,trail:•,extends:»,precedes:«,nbsp:_
set list

" Line numbers
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

let g:startify_bookmarks = [ '$MYVIMRC', '/Users/ecantin/Dropbox/todo/todo.txt' ]

" Always show statusline
set laststatus=2

" GUI-specific things (MacVim and gVIM)
if has("gui_running")
	" Color Scheme
	colorscheme solarized
	set background=dark
	" Remove toolbar and menubar
	set guioptions-=T
	" Set font
	set gfn=DejaVu\ Sans\ Mono\ for\ Powerline:h11
	" Platform-specific:
	if (has('win32') || has('win64'))
		" Maximize window
		au GUIEnter * simalt ~n
	endif
endif

" ================================================================================
" Plugins settings
" ================================================================================

" Configure Vim-Airline
let g:airline_powerline_fonts = 1
"let g:airline#extensions#branch#enabled = 0

" Do not change CTRL-P's working dir
let g:ctrlp_working_path_mode = 0

"let g:nodejs_complete_config = {
"\  'js_compl_fn': 'jscomplete#CompleteJS',
"\  'max_node_compl_len': 15
"\}

let g:EclimCompletionMethod = 'omnifunc'

let g:used_javascript_libs = 'underscore,backbone,angularjs,angularui,jquery'

" Automatically sync NERDTree
"autocmd BufWinEnter * NERDTreeMirror

" No line numbers in NERDTree
let NERDTreeShowLineNumbers=0


" Configure Unite.vim
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
call unite#custom#source('line,outline','matchers','matcher_fuzzy')
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_prompt='» '
let g:unite_source_grep_command='ack'
let g:unite_source_grep_default_opts='--no-heading --no-color -a'
let g:unite_source_grep_recursive_opt=''

" ================================================================================
" Key mappings
" ================================================================================

" <leader>
let mapleader = ","

" Remap some keys to make window navigation less painful
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

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
noremap <C-V> "+gP
noremap <S-Insert> "+gP

cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
inoremap <S-Insert> <C-V>
vnoremap <S-Insert> <C-V>


" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Buffer navigation
nnoremap <leader>c :bd<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>j :tabnext<CR>
nnoremap <leader>k :tabprevious<CR>


noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>f :NERDTreeFind<CR>

map <C-p> :CtrlP<CR>
map <C-b> :CtrlPBuffer<CR>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


" Search with Ctrl-F
noremap <C-f> :Ack --ignore-dir server/node_modules --ignore-dir node_modules -i 


" Unite.vim
nmap <space> [unite]
nnoremap [unite] <nop>
nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec buffer file_mru bookmark<cr><c-u>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec<cr><c-u>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>


" ================================================================================
" Auto-commands on start
" ================================================================================
autocmd VimEnter *
            \ if !argc() |
            \   Startify |
            \   NERDTree |
            \   execute "normal \<c-w>w" |
            \ endif

" ================================================================================
" Fixes...
" ================================================================================

" CtrlP or NERDTree open a split in Startify!
autocmd FileType startify setlocal buftype=

" ================================================================================
" Look for local vim config files
" ================================================================================

if filereadable(".vim.custom")
	so .vim.custom
endif

