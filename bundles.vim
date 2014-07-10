set nocompatible               " be iMproved
filetype off                   " required!

if has('win32') || has('win64')
  set rtp+=~/vimfiles/bundle/vundle/
  call vundle#rc('$HOME/vimfiles/bundle/')
else
  " Usual quickstart instructions
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
endif

" Init Vundle :
Plugin 'gmarik/vundle'

"Generally useful:
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'triglav/vim-visual-increment'

" Customization :
Plugin 'emilecantin/vim-colorschemes'
Plugin 'mhinz/vim-startify'
Plugin 'bling/vim-airline'
Plugin 'techlivezheng/vim-plugin-minibufexpl'

" Autocomplete :
Plugin 'Valloric/YouCompleteMe'

" Search & navigation :
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/unite.vim'

" Language support :
Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'ap/vim-css-color'
Plugin 'vim-scripts/genutils'
Plugin 'michalliu/jsoncodecs.vim'
Plugin 'michalliu/jsruntime.vim'
Plugin 'freitass/todo.txt-vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'burnettk/vim-angular'

" SCM support :
Plugin 'tpope/vim-fugitive'

" Snippets :
Plugin "MarcWeber/vim-addon-mw-utils"
Plugin "tomtom/tlib_vim"
Plugin "garbas/vim-snipmate"
Plugin "honza/vim-snippets"


filetype plugin indent on     " required!
