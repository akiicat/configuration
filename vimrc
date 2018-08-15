set nocompatible              " be iMproved, required
filetype off                  " required

set directory=/tmp             " set swap file path

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'rstacruz/sparkup', {'rtp': 'vim'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'

Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'rhysd/vim-crystal', { 'for': ['cr', 'crystal'] }
Plug 'slim-template/vim-slim', { 'for': ['slim'] }
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

call plug#end()

filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
set nu

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set nowrap

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:Â

" sparkup expand html tag for all type file
set ft=html

" vim-prettier
" max line length that prettier will wrap on
let g:prettier#config#print_width = 120

" syntax highlighting
syntax enable

" different tabs for different languages
" https://stackoverflow.com/questions/33291130/how-can-i-configure-vim-for-2-different-languages
" autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" backspace issue on vim 8
set backspace=indent,eol,start

" prettier auto format
" vim 8
" autocmd BufWritePre *.js,*.css,*.scss,*.less PrettierAsync
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.css,*.scss,*.less Prettier


" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" map a specific key or shortcut to open NERDTree `≈` alt+x
nmap ≈ :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" show hidden files
let NERDTreeShowHidden=1

" next tab
nnoremap <C-L> gt
nnoremap <C-H> gT

" move current tab to next ¬ alt+l
" move current tab to prev ˙ alt+h
nnoremap ¬ :+tabmove<cr>
nnoremap ˙ :-tabmove<cr>

" copy gy
nmap <silent> gya :silent<Space>w<Space>!pbcopy<CR>
nmap <silent> gyy Vgy
vmap <silent> gy  :<C-U>silent<Space>'<,'>w<Space>!pbcopy<CR>

" paste alt + v
nmap <silent> √ :r!<Space>pbpaste<CR>

" multi cursor exit insert mode
nnoremap <C-c> :call multiple_cursors#quit()<CR>

" slim patch issue
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

