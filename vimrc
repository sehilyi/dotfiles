call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

call plug#end()

" character for indent guideline
let g:indentLine_color_term = 61
let g:indentLine_char = '▏'
" let g:indentLine_leadingSpaceChar='·'
" let g:indentLine_leadingSpaceEnabled='1'

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
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
nnoremap <f12> :ALEGoToDefinition<CR>
nnoremap <S-f12> :ALEFindReferences<CR>

set re=0 " Use new regular expression engine (https://jameschambers.co.uk/vim-typescript-slow)
set encoding=UTF-8
set backspace=indent,eol,start
set signcolumn=no
set scrolloff=15
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
set showmatch
set expandtab " use white spaces for tabs
set cursorline " show current line
set mouse=a
set history=100
set undofile " allow undoing when reopening a file
set undodir=~/.vim/undo
set backup
set backupdir=~/.vim/backup
set showcmd
set wildmenu
set cmdheight=1
" set noshowmode " Use when using Airline

" Search
set hlsearch
" set ignorecase
set smartcase
set incsearch

""" Key modifier
let mapleader = " "
  
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
hi CursorLine cterm=bold ctermfg=None ctermbg=None

" (Cursor) Line Number
hi LineNR cterm=None ctermfg=61 ctermbg=None
hi CursorLineNR cterm=bold ctermfg=None ctermbg=None

" Status Bar On The Bottom
hi StatusLine ctermbg=None ctermfg=61
hi StatusLineNC ctermbg=None ctermfg=61

" Airline tabline
hi TabLine cterm=bold ctermfg=61 ctermbg=None
hi TabLineFill cterm=bold ctermfg=61 ctermbg=None
hi TabLineSel cterm=bold ctermfg=None ctermbg=None

" Folds
hi Folded ctermbg=None ctermfg=None
hi FoldColumn ctermbg=None ctermfg=white

" Highlight keywords that match with the one under the cursor (vim_current_word)
let g:vim_current_word#highlight_current_word = 1
hi CurrentWord ctermbg=238
hi CurrentWordTwins ctermbg=238

" entire size of popup window of fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" Preview window on the upper side of the window with 50% height
let g:fzf_preview_window = ['up:50%', 'ctrl-/']

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Use <enter> to open new tabs
let g:fzf_action = { 'enter': 'tab drop' }

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()

""""""""""
" NERDTree
""""""""""

" Remove help statement on the top
let NERDTreeMinimalUI=1

" Assign custom shortcuts
nnoremap <C-b> :NERDTreeToggle<CR>

" Change arrow characters
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = '' 
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

" Custom Tab Line
set tabline=%!MyTabLine()
function MyTabLine()
        let s = '' " complete tabline goes here
        " loop through each tab page
        for t in range(tabpagenr('$'))
                " set highlight
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " set the tab page number (for mouse clicks)
                let s .= '%' . (t + 1) . 'T'
                let s .= ' '
                " set page number string
                let s .= t + 1 . ' '
                " get buffer names and statuses
                let n = ''      "temp string for buffer names while we loop and check buftype
                let m = 0       " &modified counter
                let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
                " loop through each buffer in a tab
                for b in tabpagebuflist(t + 1)
                        " buffer types: quickfix gets a [Q], help gets [H]{base fname}
                        " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
                        if getbufvar( b, "&buftype" ) == 'help'
                                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
                        elseif getbufvar( b, "&buftype" ) == 'quickfix'
                                let n .= '[Q]'
                        elseif bufname(b) != 'NERD_tree_1'
                                let n .= pathshorten(bufname(b))
                        endif
                        " check and ++ tab's &modified count
                        if getbufvar( b, "&modified" )
                                let m += 1
                        endif
                        " no final ' ' added...formatting looks better done later
                        if bc > 1
                                let n .= ' '
                        endif
                        let bc -= 1
                endfor
                " add modified label [n+] where n pages in tab are modified
                if m > 0
                    " let s .= '[' . m . '+]'
                    let s .= '[*]'
                endif
                " select the highlighting for the buffer names
                " my default highlighting only underlines the active tab
                " buffer names.
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " add buffer names
                if n == ''
                        let s .= '[New]'
                else
                        let s .= n
                endif
                " switch to no underlining and add final space to buffer list
                let s .= ' '
        endfor
        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#TabLineFill#%T'
        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
                let s .= '%=%#TabLineFill#%999X' "close'
        endif
        return s
endfunction

" Update icons upon source .vimrc
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif
