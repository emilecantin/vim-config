" This file is here, because it is easier to bundle all my
" VIM config all in the same folder.
" Please symlink or copy it to ~/.vimrc


"
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


" Add smart indentation
set smartindent

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
" Ctrl-Tab and Ctrl-Shift-Tab
nnoremap <C-Tab> :bn<CR>
nnoremap <C-s-Tab> :bp<CR>
nnoremap <C-w> :bd<CR>
noremap <C-Right> :tabnext
noremap <C-Left> :tabprevious

" Use CTRL-E to do what CTRL-W used to do
noremap <C-E> <C-W>

if has("gui_running")
	" Configure Vim-Airline
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#branch#enabled = 0
	syntax on
	" Color Scheme
	colorscheme solarized
	set background=light
	set encoding=utf8
	" Set VIM to show non-printable characters
	set listchars=tab:\| ,trail:•,extends:»,precedes:«,nbsp:_
	set list
	" Platform-specific:
	if (has('win32') || has('win64'))
		" Maximize window
		au GUIEnter * simalt ~n
		" Remove toolbar and menubar
		set guioptions-=m
		set guioptions-=T
		" Set font
		set gfn=DejaVu_Sans_Mono_for_Powerline:h10:cANSI
	else
		" Set font
		set gfn=Menlo\ Regular\ for\ Powerline:h11
	endif
endif

" Look for local vim config files
if filereadable(".vim.custom")
	so .vim.custom
endif

" Do not change CTRL-P's working dir
let g:ctrlp_working_path_mode = 0

" Filetype plugin
filetype plugin indent on

" Indentation settings
set tabstop=4
set shiftwidth=4
"set expandtab

noremap <F2> :NERDTreeToggle
noremap <F3> :NERDTreeFind
noremap <F4> :TagbarToggle

"noremap <F5> :TernDef
"noremap <F6> :TernType
"noremap <F7> :TernDocBrowse

noremap <F11> :set background=light
noremap <F12> :set background=dark


map <C-p> :CtrlP<CR>
map <C-b> :CtrlPBuffer<CR>

" Perforce workspaces:
:let g:p4Presets = 'P4CONFIG'
:let g:p4DefaultPreset  = 'P4CONFIG'
:let g:p4EnableMenu = 1

" Automatically sync NERDTree
"autocmd BufWinEnter * NERDTreeMirror

" No line numbers in NERDTree
let NERDTreeShowLineNumbers=0

" Set vim to update autmatically when a file's read-only state is changed
:set autoread

let g:startify_bookmarks = [ '$MYVIMRC', '/Users/ecantin/Dropbox/todo/todo.txt' ]

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Line numbers
:au FocusLost * :set number
:au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"let g:nodejs_complete_config = {
"\  'js_compl_fn': 'jscomplete#CompleteJS',
"\  'max_node_compl_len': 15
"\}

" Search with Ctrl-F
noremap <C-f> :Ack --ignore-dir server/node_modules --ignore-dir node_modules -i 

" Always show statusline
set laststatus=2

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

let g:EclimCompletionMethod = 'omnifunc'
