call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'rose-pine/neovim', { 'as': 'rose-pine'}
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'mattn/emmet-vim'
Plug 'vimwiki/vimwiki'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'KabbAmine/vCoolor.vim'
Plug 'lilydjwg/colorizer'
Plug 'mbbill/undotree'
Plug 'barrett-ruth/live-server.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tribela/vim-transparent'
"Icon Picker
Plug 'stevearc/dressing.nvim'
Plug 'ziontee113/icon-picker.nvim'
call plug#end()

" ===Airline theme
let g:airline_theme='monochrome'

" ===COC
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=number
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1): "\<C-n>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>gf <Plug>(coc-format-selected)
nmap <leader>gf <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>fc  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-SPACE for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-space> <Plug>(coc-range-select)
xmap <silent> <C-space> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings for CoCList
" " Show all diagnostics
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ===Emmet
imap jj <ESC><C-y>,i
nmap ,, e<C-y>,i

" ===VimWiki
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" ===Fugitive
nnoremap <silent> <leader>gs :G<cr>
nnoremap <silent> <leader>gP :G pull<cr>
nnoremap <silent> <leader>gc :G commit<cr>
nnoremap <silent> <leader>gd :G diff<cr>
nnoremap <silent> <leader>gl :G log<cr>
nnoremap <silent> <leader>gh :vert bo help fugitive<cr>
nnoremap <silent> <leader>gp :G push<cr>

" ===GitGutter
" autocmd VimEnter * GitGutterToggle
nnoremap <silent> <Leader>hd :GitGutterDiffOrig<cr>
nnoremap <silent> <Leader>hf :GitGutterFold<cr>
nnoremap <silent> <Leader>hs :GitGutterStageHunk<cr>
nnoremap <silent> <Leader>hr :GitGutterUndoHunk<cr> " Revert
nnoremap <silent> <Leader>ht :GitGutterToggle<cr>

" ===FZF
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fg :Rg<cr>
nnoremap <silent> <leader>fG :GFiles<cr>
nnoremap <silent> <leader>fb :Buffers<cr>
nnoremap <silent> <C-n> :Buffers<cr>
nnoremap <silent> <leader>fk :History<cr>
nnoremap <silent> <leader>fj :Jumps<cr>
" :Rg! fullscreen preview
" :Rg no fullscreen preview

" ===Colorizer
nnoremap <silent> <leader>ee :ColorToggle<cr>

" ===Nerd Tree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <leader>m :NERDTreeFind<cr>

" ===Transparent
" default
let g:transparent_groups = ['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                            \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                            \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                            \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']

" Pmenu
let g:transparent_groups += ['Pmenu']
nnoremap <silent> <leader>tt :TransparentToggle<cr>

" ===VCoolors
let g:vcoolor_lowercase = 1
nnoremap <silent> <M-h> :VCoolor<cr>
inoremap <silent> <M-h> <esc>:VCoolor<cr>
nnoremap <silent> <M-r> :VCoolIns r<cr>		" For rgb color insertion
inoremap <silent> <M-r> <esc>:VCoolIns r<cr>		" For rgb color insertion
nnoremap <silent> <M-v> :VCoolIns h<cr>		" For hsl color insertion
inoremap <silent> <M-v> <esc>:VCoolIns h<cr>		" For hsl color insertion
nnoremap <silent> <M-w> :VCoolIns ra<cr>	" For rgba color insertion
inoremap <silent> <M-w> <esc>:VCoolIns ra<cr>	" For rgba color insertion

" ===Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" ===Lua
lua << EOF

require("icon-picker").setup({ disable_legacy_commands = true })

require("live-server").setup({
  args = { "--port=6661", "--browser=firefox" },
  -- args = { '--port=6661', '--browser=google-chrome-stable' }
})

require("rose-pine").setup({
  variant = "auto", -- auto, main, moon, or dawn
  dark_variant = "main", -- main, moon, or dawn
  dim_inactive_windows = false,
  extend_background_behind_borders = true,

  styles = {
    bold = true,
    italic = true,
    transparency = true,
  }
})

vim.cmd("colorscheme rose-pine")

EOF

nnoremap <F10> :LiveServerStart<CR>
nnoremap <F11> :LiveServerStop<CR>

nnoremap <silent> <M-y> :IconPickerYank<cr>
inoremap <silent> <M-y> <esc>l:IconPickerYank<cr>
nnoremap <silent> <M-i> :IconPickerInsert<cr>
inoremap <silent> <M-i> <esc>l:IconPickerInsert<cr>
nnoremap <silent> <M-`> :IconPickerYank emoji<cr>
inoremap <silent> <M-`> <esc>l:IconPickerYank emoji<cr>
nnoremap <silent> <M-.> :IconPickerYank nerd_font<cr>
inoremap <silent> <M-.> <esc>l:IconPickerYank nerd_font<cr>
