set encoding=UTF-8
syntax on
filetype plugin on

set number 
" set relativenumber 
set nowrap
set nobackup
set nowritebackup

set smarttab
set signcolumn=number
set tabstop=2 " When indenting with '>', use 2 spaces width
set shiftwidth=2 " On pressing tab, insert 2 spaces
set softtabstop=2
set expandtab

" Remove tilde on blank line (non-buffer)
set fillchars=eob:\ ,fold:\ ,vert:\│

set pumheight=10
set mouse=a
set showcmd
set noshowmode
set hidden

set nohlsearch
set incsearch
set noignorecase

set title
set noswapfile
set scrolloff=8
set sidescrolloff=16
set cindent
set smartindent
set timeoutlen=1000
set splitbelow
set splitright
set conceallevel=0
set cursorline
set termguicolors
set background=dark
set t_Co=256 " For tailwindcss color highlight?
set nocompatible

" Remember undo file
set undofile
set undodir=~/.vim/undodir

" Show existing tab with 4 spaces width
filetype plugin indent on

" Highlight Markdown files
autocmd BufRead,BufNewFile *.md,*.txt set filetype=markdown 

" autocmd BufRead,BufNewFile *.php set tabstop=4 shiftwidth=4 tabstop=4
" autocmd BufRead,BufNewFile *.blade.php set filetype=blade.html
" autocmd BufRead,BufNewFile *.js set tabstop=2 shiftwidth=2 tabstop=2
