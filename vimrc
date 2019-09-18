set nocompatible              " be iMproved, required
filetype off                  " required

set directory=/tmp             " set swap file path

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mg979/vim-visual-multi'
Plug 'airblade/vim-gitgutter'

" Optional
Plug 'junegunn/vim-easy-align'
" Plug 'mbbill/undotree'
" Plug 'rstacruz/sparkup', {'rtp': 'vim'}

" Syntax highlighting
" Plug 'nikvdp/ejs-syntax', { 'for': 'ejs' }
" Plug 'posva/vim-vue', { 'for': 'vue' }
" Plug 'rhysd/vim-crystal', { 'for': ['cr', 'crystal'] }
" Plug 'slim-template/vim-slim', { 'for': ['slim'] }
" Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
" Plug 'vale1410/vim-minizinc', { 'for': ['mzn', 'fzn'] }

call plug#end()

" Install
" vim +PlugInstall
" vim +PlugInstall +qall
" :PlugInstall

filetype plugin indent on    " required

" Put your non-Plugin stuff after this line

" ---- Settings ----
set number
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set nowrap
set updatetime=100             " Git Gutter, vim window update time default 4000
set backspace=indent,eol,start " backspace issue on vim 8
" ---- End Settings ----
 
" ---- Highlight ----
" syntax highlighting
syntax enable

" Comment highlight
hi Comment ctermfg=DarkGrey
" ---- End Highlight ----

" ---- NERDTree ----
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | :q | endif

" show hidden files
let NERDTreeShowHidden=1

" toggle NERDTree
nmap <C-o> :NERDTreeToggle<CR> 
" ---- End NERDTree ----

" ---- Git Gutter ----
" get vim-gitgutter's original colours (based on git-diff's colours in my terminal):
hi GitGutterAdd    ctermfg=Green 
hi GitGutterChange ctermfg=Yellow
hi GitGutterDelete ctermfg=Red 

" jump between hunks
nnoremap <silent> <leader>x :GitGutterNextHunk<CR>:GitGutterPreviewHunk<CR>
nnoremap <silent> <leader>gx :GitGutterPrevHunk<CR>:GitGutterPreviewHunk<CR>
" ---- End Git Gutter ----

" ---- Tab ----
" jump to the between tabs
nnoremap <C-l> gt
nnoremap <C-h> gT

" move current tab to next ¬ alt+l
" move current tab to prev ˙ alt+h
nnoremap <A-L> :+tabmove<cr>
nnoremap <A-H> :-tabmove<cr>
nnoremap ¬ :+tabmove<cr>
nnoremap ˙ :-tabmove<cr>
" ---- End Tab ----

" ---- Copy and Paste ----
" copy gy
vmap <silent> gy :<C-U>silent<Space>'<,'>w<Space>!pbcopy<CR>

" paste alt + v
" nmap <silent> √ :r!<Space>pbpaste<CR>
" ---- End Copy and Paste ----

