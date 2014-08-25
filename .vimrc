set nocompatible
filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'mattn/emmet-vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'kchmck/vim-coffee-script'
" Markdown syntax plugin + dependencies
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

syntax on
filetype plugin indent on
set background=dark

au VimEnter * NERDTree
au VimEnter * if !argc() | NERDTree | endif
au VimEnter * wincmd p
