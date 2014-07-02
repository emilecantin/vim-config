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
Bundle 'gmarik/vundle'

"Generally useful:
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'

" Customization :
Bundle 'emilecantin/vim-colorschemes'
Bundle 'mhinz/vim-startify'
Bundle 'bling/vim-airline'
Bundle 'techlivezheng/vim-plugin-minibufexpl'

" Autocomplete :
Bundle 'Valloric/YouCompleteMe'

" Search & navigation :
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Shougo/unite.vim'

" Language support :
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'ap/vim-css-color'
Bundle 'vim-scripts/genutils'
Bundle 'michalliu/jsoncodecs.vim'
Bundle 'michalliu/jsruntime.vim'
Bundle 'freitass/todo.txt-vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'burnettk/vim-angular'

" SCM support :
Bundle 'tpope/vim-fugitive'

" Snippets :
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"


filetype plugin indent on     " required!
