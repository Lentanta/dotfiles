" nvim config
:set number
:set relativenumber
:set autoindent
:set encoding=UTF-8
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set smarttab
:set expandtab
:set mouse=a

filetype indent on
filetype plugin indent on

" Theme
syntax on
set background=dark
set hidden
set list
set listchars=tab:»·,trail:·

" Plugin config
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline' " vim status bottom bar
Plug 'vim-airline/vim-airline-themes' " themes for airline
Plug 'chun-yang/auto-pairs'
Plug 'sts10/vim-pink-moon'

call plug#end()

" Set colorsheme
colorscheme pink-moon

" NERDTree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Airline config
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" ========== Coc-vim setting START ==========
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" ========== Coc-vim setting END ==========
