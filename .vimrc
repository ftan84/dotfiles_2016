" Skip VIM settings if opening using Vi
if v:progname == "vi"
    finish
endif

" =====================
" Reset settings
" =====================

" It changes other options as side effect
set nocompatible

" ==========================================
" Vundle
" ==========================================

" Setup for vundle
filetype off
set rtp+=~/.environment_settings/vim/bundle/Vundle.vim
call vundle#begin()

" Initialize the vundle plugin
Plugin 'gmarik/Vundle.vim'

Plugin 'sickill/vim-monokai'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-fugitive'
Plugin 'jpalardy/vim-slime'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'chrisbra/csv.vim'
" Plugin 'ivanov/vim-ipython.git'
" Plugin 'alfredodeza/pytest.vim'
" Plugin 'klen/python-mode'

call vundle#end()
" ==========================================
" End Vundle
" ==========================================

" Set modifiable so vim-fugitive will work
set modifiable

" Set the encoding to UTF-8
set encoding=utf-8

" Shared clipboard
set clipboard=unnamedplus

" Set the font to work with powerline symbols
set guifont=Inconsolata\ for\ Powerline\ 12

" Startup options for gui vim
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" This terminal supports colors
" set term=rxvt-256color
set term=xterm-256color

" Color scheme
set t_Co=256
colorscheme gruvbox " Use theme 'gruvbox'
set background=dark

" Sets syntax highlighting to on
syntax on

" Sets search highlight on
set hlsearch

" Sets line numbers to on
" Using both relative and absolute line numbers
set relativenumber
set number

" Set ruler
set ruler

" #### Python Setting ####
" Sets the indent rules
" set smartindent
filetype indent plugin on
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

" Omni complete support
set omnifunc=syntaxcomplete#Complete

" Fixes weird backspace problems
" set backspace=2

" Wrap settings
" set wrap
" set nolist
" set textwidth=79
" set wrapmargin=0
" set formatoptions+=t

" Ignore case sensitity
" set smartcase

" Highlight & incremental search
" set hlsearch
" set incsearch

" #### End Python Settings ####

" Always display status line
set laststatus=2

" Set large history
set history=200
set undolevels=200

" Operator time out
set timeoutlen=500

" Show the operator command
set showcmd

" No more swap files
set nobackup
set noswapfile

" Set to use mouse
set mouse=a

" Settings for the modules
source ~/.environment_settings/vim/module_settings

" Printing options
set popt=number:y

" Color column at 80
set colorcolumn=80
highlight ColorColumn ctermbg=0

" Highlight current line
set cursorline

" Change the highlight color
:hi Visual guibg=Gray30 gui=None

" =============================
" Custom mappings
" =============================
" Change the leader key to spacebar
let mapleader = ","

" Window key mappings
" Using Ctrl
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" Change the save function to leader s
nnoremap <Leader>s :w<CR>

" Change the quit function to leader q
nnoremap <Leader>q :q<CR>

" Use space for folding
" set foldmethod=indent
nnoremap <space> za
vnoremap <space> za

" Trailing whitespaces
" match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" =============================
" Custom mappings for plugins
" =============================
" Nerdtree Toggle
nnoremap <Leader>nt :NERDTreeToggle<CR>

" Fugitive settings
nnoremap <Leader>stat :Gstatus<CR>
nnoremap <Leader>push :Gpush origin

" Run nosetests
nnoremap <Leader>test :! nosetests -s<CR>

" Syntastic mappings
nnoremap <Leader>lint :SyntasticCheck<CR> :Errors<CR>

" Python mode remap
" nnoremap <Leader>lint :PymodeLintAuto<CR>
