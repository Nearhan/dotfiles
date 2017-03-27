""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" PERSONAL .vimrc FILE
" Maintained by Farhan Syed
" Last updated: 03/24/2017
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preamble
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{
set nocompatible                  " sets vi capatiblity to no
filetype off
syntax enable                     " enables syntax processing
set t_Co=256
set termencoding=utf-8
highlight Normal ctermfg=grey ctermbg=black
let mapleader=","                 " making the leader a comma
let maplocalleader="\\"

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')


Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'fatih/vim-go'


" Initialize plugin system
call plug#end()
set runtimepath^=~/.vim/bundle/ctrlp.vim "Load Ctrl.p runtime"
filetype plugin indent on         " load file-type specific indent files
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{

set autoindent
set autoread
set autowriteall
set backspace=indent,eol,start
set encoding=utf-8
set hidden
set history=1000
set laststatus=2
set lazyredraw                    " redray only when needed
set linebreak
set nolist
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set matchtime=3
set modeline
set modelines=5
set mouse=a
set noerrorbells
set notimeout
set number                        " show line numbers
set ruler
set shiftround
set shiftwidth=4
set showcmd                       " show command in bottom bar
set showmatch                     " highlights matching [{()}]
set showmode
set splitbelow
set splitright
set synmaxcol=512
set termencoding=utf-8
set textwidth=0
set title
set ttimeout
set ttimeoutlen=10
set undofile
set undolevels=1000
set undoreload=10000
set visualbell
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/**,*.pyc,*/.bower-cache/**,*/.sass-cache/**
set wildmenu                      " visual autocomplete for command menu
set wrap
set wrapmargin=0
set noundofile
set clipboard=unnamed
" }}}
 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs, Spaces & ColorColumn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{
set tabstop=4                     " number of visual spaces per TAB is 4
set softtabstop=4                 " number of spaces in tabs while editing is 4
set expandtab                     " tabs are saved as spaces
set colorcolumn=80
set background=dark
let g:solarized_termcolors=256
let g:solarized_visibilit ="high"
let g:solarized_contrast="high"
colorscheme monokai


:map <C-n> :NERDTreeToggle<CR>
let g:ctrlp_show_hidden = 1
set nobackup      " #no backup files
set nowritebackup " #only in case you don't want a backup file while editing
set noswapfile

au BufRead,BufNewFile *.template set filetype=html

let g:ctrlp_extensions = ['line', 'dir']

" add goo imports
let g:go_fmt_command = "goimports"
