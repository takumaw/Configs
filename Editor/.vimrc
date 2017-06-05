"
" .vimrc
"

" general
"

set showcmd
set showmode

" encoding
"

set encoding=utf-8
"set termencoding=utf-8
set fileencoding=utf-8 " used for writing
"set fileencodings=iso-2022-jp,euc-jp,sjis,ucs-bom,utf-8 " used for reading
set fileformat=unix " used for writing
set fileformats=dos,mac,unix " used for reading
set nobomb " disable utf-8 with BOM

" viewing
"

syntax on
highlight Normal ctermbg=black ctermfg=white
set number
set ruler
"set list
"set listchars=eol:$,tab:>\ ,extends:<
set scrolljump=1
set sidescroll=1

" editing
"

set undolevels=1000
"set pastetoggle=
"set clipboard=unnamed

set autoindent
set smartindent
"set breakindent
set showmatch

set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set completeopt=menu,menuone,preview

set dictionary+=/usr/share/dict/words

set expandtab
set shiftwidth=4
set softtabstop=4

" searching
"

set hlsearch
set incsearch
set ignorecase
"set smartcase

" keybinding
"

" make PageUp and PageDown keep the original cursor position
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>
nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>
