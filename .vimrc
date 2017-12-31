set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rhysd/vim-crystal'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
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

" syntax highlighting
syntax enable

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

