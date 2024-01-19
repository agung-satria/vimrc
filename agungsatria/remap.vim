let mapleader = " "
nnoremap <leader>pv <cmd>Ex<CR>

inoremap jk <esc>l
inoremap <C-c> <esc>l

nnoremap <silent> <esc> :noh<CR><esc>
xnoremap <silent> <esc> :noh<CR><esc>

" Change full buffer
nnoremap <leader>sf :%s//g<Left><Left>
" Change current line
nnoremap <leader>sc :s//g<Left><Left>
" Change word under cursor
nnoremap <leader>ss :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
" Add to last line; or extensions bulk rename
nnoremap <leader>ex ggVG<esc>:'<,'>s/$/changethis/<left>

nnoremap <leader>X :!chmod +x %<CR>

nnoremap <silent> <C-Up>    :resize +2<CR>
nnoremap <silent> <C-Down>  :resize -2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" list buffers and enter choice
nnoremap <silent> <Leader>l :buffers<CR>:buffer<Space>
nnoremap <silent> <TAB> <C-6>
nnoremap <silent> H :bprev<cr>
nnoremap <silent> L :bnext<cr>
nnoremap <silent> [b :bprev<cr>
nnoremap <silent> ]b :bnext<cr>
nnoremap <silent> <leader>x :bdel<cr>

nnoremap j gj
nnoremap k gk

nnoremap <silent> <A-j> <C-f>
nnoremap <silent> <A-k> <C-b>
xnoremap <silent> <A-j> <C-f>
xnoremap <silent> <A-k> <C-b>

xnoremap <silent> J :move '>+1<CR>gv-gv
xnoremap <silent> K :move '<-2<CR>gv-gv
nnoremap <silent> <M-Down> :m .+1<CR>==
nnoremap <silent> <M-Up> :m .-2<CR>==
vnoremap <silent> <M-Down> :m '>+1<CR>gv=gv
vnoremap <silent> <M-Up> :m '<-2<CR>gv=gv

xnoremap < <gv
xnoremap > >gv
nnoremap + <S-v>=

nnoremap <expr> J 'mzJ`z'
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <silent> <leader>w :w<CR>h 
nnoremap <silent> <leader>q :q<CR> 
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <esc>:w<CR>l
nnoremap <leader>; :
nnoremap Q @q " quick run macro registered in q with Q

nnoremap <silent> <leader>tn :set nu! <CR>
nnoremap <silent> <leader>tr :set rnu! <CR>
nnoremap <silent> <F6> :set nu! <CR>
inoremap <silent> <F6> <ESC> :set nu! <CR>i
nnoremap <silent> <F7> :set rnu! <CR>
inoremap <silent> <F7> <ESC> :set rnu! <CR>i

nnoremap - <C-x>
nnoremap = <C-a>

nnoremap <C-c> "+y
nnoremap <C-x> "+x
vnoremap <C-c> "+y
vnoremap <C-x> "+x
nnoremap <leader>sa mjggVG

nnoremap <leader>sq :$put =range(0,10)<left><left><left><left>

nnoremap <silent> <leader>sl <C-w>v   " Split window vertically
nnoremap <silent> <leader>sj <C-w>s   " Split window horizontally
nnoremap <silent> <leader>se <C-w>=   " Make split windows equal width & height
nnoremap <silent> <leader>sk :close<CR>  " Close current split window

nnoremap <leader>fn <cmd>enew<cr> 
nnoremap <leader>oo :e 
nnoremap <leader>oh :split 
nnoremap <leader>ov :vsplit 

nnoremap <silent> <leader>to :tabnew<CR>    " Open new tab
nnoremap <silent> <leader>tx :tabclose<CR>  " Close current tab
nnoremap <silent> ]t :tabn<CR>               " Go to next tab
nnoremap <silent> [t :tabp<CR>               " Go to previous tab
nnoremap <silent> <leader>tm :tabnew %<CR>  " Move current buffer to new tab

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" noremap <leader>d dd
" noremap <leader>h _
" noremap <leader>H _i
" noremap <leader>l $
" noremap <leader>L $a

" noremap J <Nop>
" nmap <C-z> <Nop>
" imap <C-z> <Nop>
nmap <leader>o <Nop>

abbr emaila agungsatria890@gmail.com

nnoremap <leader>R :so<CR>
vnoremap <leader>R :so<CR>
