" Dracula custom styles which should be overriden before loading the theme
let g:dracula_bold = 1
let g:dracula_underline = 1
let g:dracula_italic = 0
let g:dracula_inverse = 0

packadd! dracula

colorscheme dracula
syntax sync fromstart
filetype plugin indent on
syntax on 

" ALE
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1
nnoremap <f12> :ALEGoToDefinition<CR>
nnoremap <S-f12> :ALEFindReferences<CR>

"
" Use new regular expression engine (https://jameschambers.co.uk/vim-typescript-slow)
set re=0
set signcolumn=no
set scrolloff=15
set shiftwidth=4
set softtabstop=4
set foldcolumn=2 " width of fold display
set foldmethod=marker " fold by index level
set foldlevel=2
set number 
set numberwidth=4
set nowrap
set tabstop=2
set autoindent
set expandtab
set showmatch
set expandtab " use white spaces for tabs
set cursorline " show current line
set mouse=a
set undofile " allow undoing when reopening a file
set undodir=~/.vim/undo
set backup
set backupdir=~/.vim/backup
set history=100
set showcmd
set wildmenu
set cmdheight=1

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch

""" Key modifier

" Fix typo
nnoremap q: :q

" Tab navigation
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc> :tabnew<CR>i
nnoremap J :tabprev<CR>
nnoremap K :tabnext<CR>

""""""""""""""
" Custom Style
""""""""""""""

" Text Colors
" hi Normal ctermfg=white

" Remove color so that we use the same bg color as terminal
hi Normal ctermbg=None

" Cursor Underline
hi CursorLine cterm=None ctermfg=None ctermbg=None

" (Cursor) Line Number
hi LineNR cterm=None ctermfg=61 ctermbg=None
hi CursorLineNR cterm=bold ctermfg=None ctermbg=None

" Status Bar On The Bottom
hi StatusLine ctermbg=None ctermfg=61
hi StatusLineNC ctermbg=None ctermfg=61

" Folds
hi Folded ctermbg=None ctermfg=None
hi FoldColumn ctermbg=None ctermfg=white

""""""""""
" NERDTree
""""""""""

" Assign custom shortcuts
" nnoremap <C-e> :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

" Change arrow characters
let g:NERDTreeDirArrowExpandable = '├'
let g:NERDTreeDirArrowCollapsible = '└' 
let g:NERDTreeMapActivateNode = '<tab>'
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Change vertical split character
set fillchars+=vert:\▏

" Remove vertical split background
hi VertSplit cterm=None
hi VertSplit ctermfg=61
