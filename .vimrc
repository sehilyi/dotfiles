call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

call plug#end()

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

set re=0 " Use new regular expression engine (https://jameschambers.co.uk/vim-typescript-slow)
set encoding=UTF-8
set backspace=indent,eol,start
set signcolumn=no
set scrolloff=6
set shiftwidth=4
set softtabstop=4
set foldcolumn=2 " width of fold display
set foldmethod=marker " fold by index level
set foldlevel=2
set number 
set numberwidth=4
set laststatus=2
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
" set noshowmode " Use when using Airline

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch

""" Key modifier
let mapleader = " "
 
" Fix typo
nnoremap q: :q

" Tab navigation
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>h :tabprev<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>1 1gt<CR>
nnoremap <leader>2 2gt<CR>
nnoremap <leader>3 3gt<CR>
nnoremap <leader>4 4gt<CR>
nnoremap <leader>5 5gt<CR>
nnoremap <leader>6 6gt<CR>
nnoremap <leader>7 7gt<CR>
nnoremap <leader>8 8gt<CR>
nnoremap <leader>9 9gt<CR>

nnoremap <C-f> :Ag<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>p :Files<CR>

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

" Airline tabline
hi TabLine cterm=bold ctermbg=None
hi TabLineFill cterm=bold ctermbg=None
hi TabLineSel ctermbg=61

" Folds
hi Folded ctermbg=None ctermfg=None
hi FoldColumn ctermbg=None ctermfg=white

" Highlight keywords that match with the one under the cursor (vim_current_word)
let g:vim_current_word#highlight_current_word = 1
hi CurrentWord ctermbg=238
hi CurrentWordTwins ctermbg=238

""""""""""
" NERDTree
""""""""""

" Remove help statement on the top
let NERDTreeMinimalUI=1

" Assign custom shortcuts
nnoremap <C-b> :NERDTreeToggle<CR>

" Change arrow characters
let g:NERDTreeDirArrowExpandable = '├'
let g:NERDTreeDirArrowCollapsible = '└' 
" let g:NERDTreeMapActivateNode = '<tab>'
let NERDTreeMapOpenInTab='<tab>'

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Change vertical split character
set fillchars+=vert:\▏

" Remove vertical split background
hi VertSplit cterm=None
hi VertSplit ctermfg=61

" Airline's Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tabs_label = '' " Remove defalt 'tabs'

" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
" let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''

" autocmd VimEnter * ++nested NERDTree | wincmd p " https://github.com/itchyny/lightline.vim/issues/591

" Update icons upon source .vimrc
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif
