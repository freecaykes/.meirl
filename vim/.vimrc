syntax on
colorscheme monokai
set number

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Vundle-plugin installer
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" NERDTree on start if no file
autocmd VimEnter * if !argc() | NERDTree | endif 

""""""""""""""""
" keybindings  "
""""""""""""""""

" switch between tabs [Ctrl+t+direction]
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
