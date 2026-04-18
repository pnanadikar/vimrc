set shell=/bin/bash
colorscheme desert
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:ctrlp_match_window = 'bottom,order:ttb,min:4,max:40,results:40'
" Allow switching between windows and resizing windows using mouse.
set mouse=a
set termguicolors
set foldmethod=marker
set nowrap
set showcmd
set norelativenumber!
nnoremap <leader>F :%!jq<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the ripgrep if possible (much faster than Ack)
if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case'
endif
#
" =========================
" Vimdiff Configuration
" =========================

" --- Diff Colors ---
highlight DiffAdd    ctermfg=green  guifg=green  
highlight DiffChange ctermfg=yellow guifg=orange 
highlight DiffDelete ctermfg=red    guifg=red    
highlight DiffText   ctermfg=blue   guifg=blue  

" --- Navigation Shortcuts ---
nnoremap ]c ]c
nnoremap [c [c
nnoremap <leader>n ]c   " jump to next change
nnoremap <leader>p [c   " jump to previous change

" --- Merge Shortcuts ---
nnoremap <leader>do :diffget<CR>   " get changes from other file
nnoremap <leader>dp :diffput<CR>   " put changes into other file

" --- Window Management ---
nnoremap <leader>w <C-w>w          " switch windows
nnoremap <leader>= <C-w>=          " equalize window sizes

" --- Toggle Diff Mode ---
nnoremap <leader>d :windo diffthis<CR>
nnoremap <leader>u :windo diffoff<CR>

" --- Git Integration ---
if has("autocmd")
  autocmd BufReadPost *
        \ if &diff |
        \   nnoremap <buffer> <leader>m :Gdiffsplit!<CR> |
        \ endif
endif

" --- Quality of Life ---
set diffopt+=vertical   " vertical split by default
set diffopt+=iwhite     " ignore whitespace changes
set diffopt+=hiddenoff  " show hidden lines in diff

