set t_Co=256

set ts=4 sw=4 expandtab autoindent number smartindent
set bg=dark

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'morhetz/gruvbox'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'

call vundle#end()

filetype plugin indent on

let g:gruvbox_contrast_dark = 'hard'
color gruvbox
syntax on 
