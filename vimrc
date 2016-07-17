" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'plasticboy/vim-markdown'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-commentary'

call vundle#end()
filetype plugin indent on

" general settings
set autoindent
set smartindent
set autoread                        " reload files when changed on disk, i.e. via `git checkout`
set nobackup                        " no backups
set nowritebackup
set clipboard=unnamed               " yank and paste with the system clipboard
set directory-=.                    " don't store swapfiles in the current directory
set encoding=utf-8
set ignorecase                      " case-insensitive search
set smartcase                       " case-sensitive search if any caps
set hlsearch                        " highlight search
set incsearch                       " search as you type
set laststatus=2                    " always show statusline
set number                          " show line numbers
set ruler                           " show where you are
set cursorline                      " highlight current line
set nostartofline                   " Avoid moving cursor to BOL when jumping around
set backspace=2                     " Fix broken backspace in some setups
set virtualedit=block               " Let cursor move past the last char in <C-v> mode
set scrolloff=3                     " show context above/below cursorline
set showcmd
set expandtab                       " expand tabs to spaces
set softtabstop=4                   " insert mode tab and backspace use 4 spaces
set shiftwidth=4                    " normal mode indentation commands use 4 spaces
set shiftround                      " rounds indent to a multiple of shiftwidth
set tabstop=4                       " actual tabs occupy 4 characters
set wildignore=*.o,*.obj,.git,*.pyc
set wildmenu                        " show a navigable menu for tab completion
set wildmode=full
set lazyredraw                      " Don't redraw while executing macros (good performance config)
set magic                           " For regular expressions turn magic on
set showmatch                       " Show matching brackets when text indicator is over them
set matchtime=2                     " How many tenths of a second to blink when matching brackets
set vb t_vb=                        " Disable all bells
set title                           " show title in console title bar
set wrap
set linebreak
set nofoldenable

syntax enable
set background=dark
colorscheme solarized

" keyboard shortcuts
let mapleader = ","
imap jj <esc>
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <leader>c :bd<cr>
map <leader>n :enew<cr>
map <leader>l :Tabularize /
map <leader>a :Ag<space>
map <leader>f :Explore<cr>
map <leader>g :GitGutterToggle<cr>
map <leader>u :GundoToggle<cr>
map <c-up> {
map <c-down> }

" Remove trailing whitespace on <leader>S
nmap <leader>S :%s/\s\+$//<cr>:let @/=''<cr>

" Treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk

" Disable highlight when <leader>/ is pressed
map <silent> <leader>/ :noh<cr>

" allow command line editing like emacs
imap <c-a> <c-o>^
imap <c-e> <c-o>$

" grep word under cursor
nmap <leader>j :Ag "\b<c-r><c-w>\b"<cr>:cw<cr>

" edit vimrc/zshrc and load vimrc bindings
nmap <leader>ev :e $MYVIMRC<cr>
nmap <leader>ez :e ~/.zshrc<cr>
nmap <leader>sv :source $MYVIMRC<cr>

" CTRL-s to Save
map  <c-s> :w<cr>
imap <c-s> <esc>:w<cr>

" plugin settings
let g:ctrlp_match_window                         = 'order:ttb,max:20'
let g:UltiSnipsListSnippets                      = "<c-j>"
let g:netrw_liststyle                            = 3 " format for Explore
let g:gitgutter_enabled                          = 0
let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
    let g:ctrlp_regexp = 1
endif

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" gui options
if has('gui_macvim')
    set guioptions-=L
    set guioptions-=r
    set guifont=Source\ Code\ Pro\ Light:h14
    let macvim_hig_shift_movement = 1
    autocmd GUIEnter * set fullscreen
endif

" vim-go settings
let g:go_fmt_command         = "goimports"
let g:go_highlight_functions = 1
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>w <Plug>(go-doc-browser)
au FileType go nmap <c-x> :GoDecls<cr>
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')

" Source local changes
if filereadable(expand("~/.vimrc.local"))
    " In your .vimrc.local, you might like:
    "
    " set nocursorline
    " colorscheme X
    " let g:airline_theme='dark'
    " set list listchars=tab:▸\ ,trail:▫
    " set nowrapscan
    " set colorcolumn=80
    source ~/.vimrc.local
endif
