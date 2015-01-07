set nocompatible
filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
" Syntax plugins
Plugin 'plasticboy/vim-markdown'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'leshill/vim-json'
" Tools
Plugin 'mattn/emmet-vim'

syntax on
filetype plugin indent on
set background=dark

au VimEnter * NERDTree
au VimEnter * if !argc() | NERDTree | endif
au VimEnter * wincmd p
