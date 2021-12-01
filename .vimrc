call plug#begin()
    Plug 'preservim/nerdtree'
call plug#end()

let mapleader=" "
syntax on
set number relativenumber
set splitbelow splitright
set wildmode=longest,list,full

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set nu
set smartcase
set noswapfile
set incsearch
set autoindent
set title
:filetype on

"Keystroke simplification
inoremap jj <esc>l
nnore <tab> i<tab>
nnore ; :

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap ' ''<Esc>ha
inoremap " ""<Esc>ha
inoremap ` ``<Esc>ha
inoremap [ []<Esc>ha
inoremap <div> <div></div><esc>6ha
inoremap <li> <li></li><esc>5ha
inoremap <h1> <h1></h1><esc>5ha
inoremap <ul> <ul></ul><esc>5ha
inoremap <button> <button></button><esc>9ha

"Easy navigation
nnore ml <c-w>l
nnore mh <c-w>h
nnore mj <c-w>j
nnore mk <c-w>k
tnoremap <Esc> <C-\><C-n>:q!<CR>

"Allow for creating new window in buffer
:set modifiable

"Automatically deletes all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

"Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Mapping for nerdtree access
nnoremap <C-n> :NERDTree<CR>
autocmd VimEnter * NERDTree | wincmd p

"Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

