" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'fatih/vim-go'
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'tpope/vim-commentary'
Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nvie/vim-flake8'
Plug 'fs111/pydoc.vim'
Plug 'posva/vim-vue'
call plug#end()

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

colorscheme solarized
if $ITERM_PROFILE == 'Light'
    set background=light
else
    set background=dark
endif

" keyboard shortcuts
let mapleader = ","
imap jj <esc>
map <leader>c :bd<cr>
map <leader>n :enew<cr>
map <leader>l :Tabularize /
map <leader>a :Ag<space>
map <leader>f :Explore<cr>
map <leader>g :0Glog<cr>
map <leader>u :GundoToggle<cr>

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
nmap <leader>j :Ag <c-r>=expand('<cword>')<cr><cr>

" edit vimrc/zshrc and load vimrc bindings
nmap <leader>ev :e $MYVIMRC<cr>
nmap <leader>ez :e ~/.zshrc<cr>
nmap <leader>sv :source $MYVIMRC<cr>

" CTRL-s to Save
map  <c-s> :w<cr>
imap <c-s> <esc>:w<cr>

" plugin settings
let g:pydoc_cmd = 'python -m pydoc'
" let g:pydoc_open_cmd = 'vsplit'
let g:pydoc_window_lines=30
let g:pydoc_highlight=0
let g:gundo_prefer_python3 = 1
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
endif

" Use fzf
if executable('fzf')
    nnoremap <silent> <c-p> :Files<cr>
    imap <c-x><c-k> <plug>(fzf-complete-word)
endif

" gui options
if has('gui_macvim')
    set guioptions-=L
    set guioptions-=r
    set guifont=Source\ Code\ Pro\ Light:h14
    "let macvim_hig_shift_movement = 1
    "autocmd GUIEnter * set fullscreen
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

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

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
