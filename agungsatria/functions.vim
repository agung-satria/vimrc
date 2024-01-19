" ===Go to last position when opening a buffer
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" ===Highlight yanked text
augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
augroup END

" ===Toggle wrap
map <silent> <M-z> :call ToggleWrap()<CR>
map! <silent> <M-z> ^[:call ToggleWrap()<CR>

function ToggleWrap()
  if (&wrap == 1)
    set nowrap
  else
    set wrap
  endif
endfunction

" ===Toggle case sensitive/ignorecase on search
nnoremap <leader>i :call ToggleIgnoreCase()<CR>

function! ToggleIgnoreCase()
  let &ignorecase = !&ignorecase
  if &ignorecase
    echo "Ignorecase"
  else
    echo "No ignorecase"
  endif
endfunction

" ===Toggle highlight search
nnoremap <leader>hh :call ToggleHlsearch()<CR>

function! ToggleHlsearch()
  let &hlsearch = !&hlsearch
  if &hlsearch
    echo "Hlsearch"
  else
    echo "No hlsearch"
  endif
endfunction

" ===Copy full path (in current buffer)
nnoremap <leader>y :call CopyFilePath()<CR>
nnoremap <leader>sp :call CopyFilePath()<CR>

function! CopyFilePath()
  let @+ = expand("%:p")
  echo "File path copied to clipboard: " . expand("%:p")
endfunction

" ===Close some filetypes with <q>
function! s:buffer_del_with_q(event)
    setlocal buflisted&
    nnoremap <buffer> q <cmd>bd<CR>
endfunction

augroup buffer_del_with_q
    autocmd!
    autocmd FileType checkhealth,fugitive,help call s:buffer_del_with_q(expand('<afile>'))
augroup END

" ===Toggle the bottom statusbar
nnoremap <silent> <leader>b :call ToggleStatusBar()<cr>

let s:hidden_all = 0

function! ToggleStatusBar()
  if s:hidden_all  == 0
    let s:hidden_all = 1
    set noshowmode
    set noruler
    set laststatus=0
    set noshowcmd
  else
    let s:hidden_all = 0
    set showmode
    set ruler
    set laststatus=2
    set showcmd
  endif
endfunction

" Auto run ToggleStatusBar
" augroup FirstOpen
"     autocmd!
"     autocmd VimEnter * :call ToggleStatusBar()
" augroup END
