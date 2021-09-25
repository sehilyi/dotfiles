packadd! dracula

colorscheme dracula
syntax sync fromstart
syntax on 
filetype on

" Use new regular expression engine (https://jameschambers.co.uk/vim-typescript-slow)
set re=0

set number
set numberwidth=4
set nowrap
set tabstop=2
set autoindent
set showmatch
set expandtab "use white spaces for tabs
set cursorline "show current line
set mouse=a
set showmatch

" Remove color so that we use the same bg color as terminal
highlight Normal ctermbg=None

""""""""""""""
" Custom Style
""""""""""""""

" Cursor Underline
hi CursorLine cterm=underline ctermfg=None ctermbg=None

" Cursor Line Number
hi CursorLineNR cterm=bold ctermfg=None ctermbg=None

" Status Bar On The Bottom
hi StatusLine ctermbg=None ctermfg=None
hi StatusLineNC ctermbg=None ctermfg=None


" Text Colors
hi Normal ctermfg=white

""""""""""
" NERDTree
""""""""""

" Change vertical split character
set fillchars+=vert:\▏

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Remove vertical split background
highlight VertSplit cterm=None
highlight VertSplit ctermfg=235
