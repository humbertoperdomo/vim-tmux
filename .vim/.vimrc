" ============================================================================
" Humberto Perdomo .vimrc file
" -----------------------------------------------------------------------------
" heavily inspired by: @millermedeiros.
" =============================================================================


" -----------------------------------------------------------------------------
" BEHAVIOR
" -----------------------------------------------------------------------------

set nocompatible            " Disable vi compatibility

filetype on                 " filetype must be 'on' before setting it 'off'
                            "   otherwise it exits with a bad status and breaks
                            "   git commit.
filetype off                " force reloading *after* pathogen loaded

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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
Plugin 'vim-scripts/bufkill.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'airblade/vim-gitgutter'

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomsik68/vim-crystallite'

" All of your Plugins must be added before the following line
call vundle#end()

syntax on
filetype plugin indent on   " enable detection, plugins and indent

"set guifont=Monospace\ Regular\ 9
"set background=dark " Assume a dark background

" Local dirs (centralize everything)
set backupdir=~/.vim/tmp,/tmp
set directory=~/.vim/tmp,/tmp


" Change mapleader (easier to type), at the top since its used everywhere
let mapleader=","
let maplocalleader=";"

set spelllang=en_us         " spell checking
set encoding=utf-8 nobomb   " BOM often causes trouble, UTF-8 is awsum.


" --- performance / buffer ---
set hidden                  " can put buffer to the background without writing
                            "   to disk, will remember history/marks.
set nolazyredraw              " don't update the display while executing macros
set ttyfast                 " Send more characters at a given time.


" --- history / file handling ---
set history=10000             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally


" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile


" --- search / regexp ---
set gdefault                " RegExp global by default
set magic                   " Enable extended regexes.
set hlsearch                " highlight searches
set incsearch               " show the `best match so far' astyped
set ignorecase smartcase    " make searches case-insensitive, unless they
                            "   contain upper-case letters

" --- keys ---
set backspace=indent,eol,start  " allow backspacing over everything.
set esckeys                     " Allow cursor keys in insert mode.
set nostartofline               " Make j/k respect the columns
" set virtualedit=all            " allow the cursor to go in to 'invalid' places
set timeoutlen=500              " how long it wait for mapped commands
set ttimeoutlen=100             " faster timeout for escape key and others


" Use a bar-shaped cursor for insert mode, even through tmux.
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------

"set t_Co=256                " 256 colors terminal


"if has('gui_running')
  "colorscheme solarized
  "let g:solarized_termcolors=256
"else
  "colorscheme zenburn
"endif

set background=dark
colorscheme crystallite
" default ColorColumn is too distractive
hi clear ColorColumn
hi link ColorColumn FoldColumn
" defaul line number is too distractive
"hi clear LineNr
hi link LineNr Comment
hi link OverLength Error


set cursorline              " Highlight current line
set mat=2                   " how many tenths of a second to blink
set laststatus=2            " Always show status line
set number                  " Enable line numbers.
set numberwidth=5           " width of numbers line (default on gvim is 4)
set report=0                " Show all changes.
set showmode                " Show the current mode.
set showcmd                 " show partial command on last line of screen.
set showmatch               " show matching parenthesis
set splitbelow splitright   " how to split new windows.
set title                   " Show the filename in the window title bar.

set scrolloff=3             " Start scrolling n lines before horizontal
                            "   border of window.
set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=1            " The minimal number of columns to scroll
                            "   horizontally.

" add useful stuff to title bar (file name, flags, cwd)
" based on @factorylabs
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f
    set titlestring+=%h%m%r%w
    set titlestring+=\ -\ %{v:progname}
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif

" use relative line number by default
if exists('+relativenumber')
  set relativenumber
endif

" --- diff ---
set diffopt=filler          " Add vertical spaces to keep right
                            "   and left aligned.
set diffopt+=iwhite         " Ignore whitespace changes.


" --- folding---
set foldmethod=indent       " manual fold
set foldnestmax=10           " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=99


" --- list chars ---
" list spaces and tabs to avoid trailing spaces and mixed indentation
" see key mapping at the end of file to toggle `list`
set listchars=tab:▹\ ,trail:·,nbsp:⚋
set fillchars=fold:-
set list


" --- remove sounds effects ---
set noerrorbells
set visualbell


" -----------------------------------------------------------------------------
" INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------

set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=4               " Tab key results in # spaces
set tabstop=4                   " Tab is # spaces
set shiftwidth=4                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width
                                "   spaces, <Bs> deletes shift width spaces.

set wrap                        " wrap lines
set wrapmargin=4    " wrap lines when coming within n characters from side
set linebreak   " set soft wrapping
set showbreak=...   " show ellipsis at breaking
set textwidth=80
"set colorcolumn=+1              " Show large lines
set formatoptions=qrn1          " automatic formating.
set formatoptions-=o            " don't start new lines w/ comment leader on
                                "   pressing 'o'

set nomodeline                  " don't use modeline (security)

set pastetoggle=<leader>p       " paste mode: avoid auto indent, treat chars
                                "   as literal.
set clipboard=unnamed


" -----------------------------------------------------------------------------
" Menu completion
" -----------------------------------------------------------------------------

set wildmenu
"set wildmode=longest list


" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" --- NERDTree ----
let NERDTreeIgnore=['.DS_Store']
let NERDTreeShowBookmarks=0         "show bookmarks on startup
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1
noremap <leader>nt :NERDTreeToggle<CR>


" --- Syntastic : Linting / Error check ---
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*
let g:syntastic_python_checkers=['pylint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5
let g:syntastic_java_javac_config_file_enabled = 1
" close/open location list (errors)
noremap <silent><leader>lc :lcl<CR>
noremap <silent><leader>lo :Errors<CR> :lw<CR>
noremap <silent><leader>ln :lnext<CR>
noremap <silent><leader>lp :lprev<CR>

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

" SimpylFold
let g:SimpylFold_docstring_preview=1

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<cr>


" Fugitive settings
nmap <silent> <leader>dd :tab split \| Gvdiff <cr>

" Tmux
nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>


" --- visual block move ---
" http://www.youtube.com/watch?v=aHm36-na4-4#t=35m10

let g:DVB_TrimWS = 1
vmap  <expr>  <S-LEFT>   DVB_Drag('left')
vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
vmap  <expr>  <S-DOWN>   DVB_Drag('down')
vmap  <expr>  <S-UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()


" --- transform lists ---
" http://www.youtube.com/watch?v=aHm36-na4-4#t=17m30

map <leader>ls :call ListTrans_toggle_format()<CR>
vmap <leader>ls :call ListTrans_toggle_format('visual')<CR>


" -----------------------------------------------------------------------------
" KEY MAPPINGS
" -----------------------------------------------------------------------------

" --- FIX/IMPROVE DEFAULT BEHAVIOR ---

" faster commands
" nnoremap <space> :

" sudo write
" command! W w !sudo tee % > /dev/null

" Swap v and CTRL-V, because Block mode is more useful that Visual mode
" nnoremap    v   <C-V>
" nnoremap <C-V>     v
" vnoremap    v   <C-V>
" vnoremap <C-V>     v

" Arrows are unvimlike 
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing
nnoremap S i<cr><esc><right>

" movement by screen line instead of file line (for text wrap)
nnoremap j gj
nnoremap k gk

" next tab
nnoremap <C-Tab> :tabn<CR>

" automatic esc, really uncommon to type jj,jk
inoremap jj <ESC>
inoremap jk <Esc>

" Faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" 'fix' search regexp to be compatible with Perl format
nnoremap / /\v
vnoremap / /\v


" --- COMMON STUFF / HELPERS ---

" Toggle show tabs and trailing spaces
nnoremap <leader>c :set nolist!<CR>

" Clear the search highlight
nnoremap <silent> \ :silent nohlsearch<CR>

" text wrap: Hard wrap paragraph text (similar to TextMate Ctrl+Q)
nnoremap <leader>tw gqip
nnoremap <leader>nw :set nowrap<CR>

" Reformat code
nnoremap <leader>rf gg=G

" I use retab too much and it's hard to type
nnoremap <leader>rt :retab!<CR>

" Insert/append a single character
" noremap ,, i_<esc>r
" noremap ;; a_<esc>r

" Visually select the text that was last edited/pasted
nnoremap <leader>v `[v`]

" Toggle spelling hints
nnoremap <silent> <leader>ts :set spell!<CR>

" Move between splits (windows)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Open current buffer in a new split
noremap <leader>s :vsplit<cr>
noremap <leader>i :split<cr>

" close window
noremap <leader>q :clo<CR>

" delete buffer but keep window open (requires bufkill.vim)
map <leader>bd :BD<CR>

" smarter next/prev buffer (requires bufkill.vim)
map <leader>bn :BF<CR>
" fixme if this shortcut does not work
map <leader>nb :BB<CR>

" resize splits (http://vim.wikia.com/wiki/Resize_splits_more_quickly)
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" add spaces inside current parenthesis
map <leader>( vi(xi  P

" Miscellaneous 
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
au FocusLost * :wa
vnoremap . :norm.<CR>
nnoremap Y y$
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %


" -----------------------------------------------------------------------------
" FILE HANDLING
" -----------------------------------------------------------------------------

" [autocommands] borrowed from @bit-theory vimfiles and edited
augroup mm_buf_cmds
    " clear commands before resetting
    autocmd!

    " when vimrc is edited, reload it
    autocmd bufwritepost ~/.vimrc source %

    " Only show cursorline in the current window and in normal mode
    au WinLeave,InsertEnter * set nocul
    au WinEnter,InsertLeave * set cul

    " highlight char at column 81 (textwidth + 1)
    autocmd BufEnter * match OverLength /\%81v/

    " Color Column (only on insert)
    if exists("&colorcolumn")
        autocmd InsertEnter * set colorcolumn=80
        autocmd InsertLeave * set colorcolumn=""
    endif
augroup END
