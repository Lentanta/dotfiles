" nvim config
set number
set relativenumber
set encoding=UTF-8
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
filetype indent on
filetype plugin indent on

" Plugin config
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" NERDTree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

