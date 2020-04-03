set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jacoborus/tender.vim'

call vundle#end()
filetype plugin indent on

syntax on
set number
set showcmd
set ruler
set listchars=tab:‣\ ,extends:…,precedes:…,nbsp:˖,trail:‿
set list
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

inoremap jj <Esc>

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|target'

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme tender

if has("clipboard")
  set clipboard=unnamed
endif
