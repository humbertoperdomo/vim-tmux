" Configuration

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Basic Settings
set ttimeoutlen=10
set nocompatible    " be iMproved, required
filetype off        " required

" set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"set guifont=Menlo:h14

" Basics
set nocompatible    " not compatible with vi
set autoread    " detect when a file is changed

" make backspace behave in a same manner
set backspace=indent,eol,start

inoremap jk <ESC>
" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

set history=10000   " change history to 10000

" tab control
set expandtab " insert spaces rather than tabs for <Tab>
set tabstop=4   " the visible with of tabs
set shiftwidth=4    " number of spaces to use for indent and unindent
set softtabstop=4   " edit as if the tabs are 4 characters wide

set clipboard=unnamed

" fasterredrawing
set ttyfast

" code folding settings
set foldmethod=syntax   " fold base on indent
set foldnestmax=10  " deepest fold is 10 levels
set nofoldenable    " don't fold by default
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""
" => User interface
"""""""""""""""""""""""""""""""""""""""""
set wildmenu    " enhanced command line completion
set hidden  " current buffer can be put in background
set showcmd " show incomple commands
set showmode    " show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=3 " lines of text around cursor
set shell=$SHELL
set cmdheight=1 " command bar height

set title

" Searching
set ignorecase  " case-insensitive searching
set smartcase   " case-sensitive if expression contains a capital letter
set hlsearch
set incsearch   " set incremental search, like modern browsers
set nolazyredraw    " don't redraw while executing macros

set magic   " Set magic on, for regex

set showmatch   " show matching braces
set mat=2   " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell

" switch syntax highlighting on
syntax on

set encoding=utf-8

set relativenumber  " show relative line numbers
set number  " show the current line number

set wrap    " turn on line wrapping
set wrapmargin=4    " wrap lines when coming within n characters from side
set linebreak   " set soft wrapping
set showbreak=...   " show ellipsis at breaking

set autoindent  " automatically set indent of new line
set smartindent
set ruler
"set colorcolumn=80

set modelines=0
set noundofile
set gdefault
set nolist
set formatoptions=qrn1
"set spell spelllang=en_us

"""""""""""""""""""""""""""""""""
" => Files, backups, and undo
"""""""""""""""""""""""""""""""""
"set nobackup
"set nowritebackup
"set noswapfile
set backupdir=~/.vim/tmp,/tmp
set directory=~/.vim/tmp,/tmp

"""""""""""""""""""""""""""""""""""""""""""
" => StatusLine
"""""""""""""""""""""""""""""""""""""""""""
set laststatus=2    " show the status line all the time

" Aesthetics
color Crystallite

" Mappings and shortcuts


" Arrows are unvimlike 
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Miscellaneous 
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
au FocusLost * :wa
vnoremap . :norm.<CR>

nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Leader shortcuts

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>a :Ack
nnoremap <leader>ft Vatzf
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>q gqip
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>j VipJ
nnoremap <leader>q gqip
nnoremap <leader>f 1z=
nnoremap <leader>s ]s
nnoremap <leader>u :!git pull website master && git commit -am 'Standard commit.' && git push website master<CR><CR>
nnoremap <leader>p :!git commit -am 'Standard commit.' && git push origin master<CR><CR>
nnoremap <leader>d :read !date<CR>
nnoremap <leader>r :!!<CR>
nnoremap <leader>m :normal @a
nnoremap <leader>l :CtrlP<CR>
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>n :set nonumber!<CR>
nnoremap <leader>rn :set norelativenumber!<CR>
nnoremap <leader>c :nohl<CR>
nnoremap <leader>pa :set nopaste!<CR>
nnoremap <leader>rc :so $MYVIMRC<CR>
nnoremap <leader>b :BlogSave publish<CR>
"nnoremap <leader>r :! /Users/daniel/Documents/whup.sh<CR><CR>
nnoremap <leader>h :set ft=HTML<CR><CR>

" Control shortcuts

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'powerlineish'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 0
let airline#extensions#tmuxline#color_template = 'normal'

" edkolev tmuxline
let g:tmuxline_powerline_separators = 1

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
