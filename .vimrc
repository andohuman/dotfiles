set t_co=256
set ts=4 sw=4 expandtab autoindent number smartindent
set bg=dark

call plug#begin('~/.vim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
color gruvbox
syntax on
