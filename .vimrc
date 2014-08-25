set nocompatible
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'scrooloose/nerdtree'

" My Bundles here:
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'mattn/emmet-vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'kchmck/vim-coffee-script'

syntax on
filetype plugin indent on
set background=dark

au VimEnter * NERDTree
au VimEnter * if !argc() | NERDTree | endif
au VimEnter * wincmd p
