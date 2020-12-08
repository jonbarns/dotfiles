"----Font configuration----"
syntax on           "Coloured source"
set showmatch       "Show matching parenthesis"
set encoding=utf-8

"----Window configuration----"
set rnu             "Include column numbers"
set noshowmode      "Removed insert/replace bar at bottom"
set laststatus=2    "Two rows at the bottom"
set splitbelow      "Horizontal split below current"
set splitright      "Vertical split to right on current"
set scrolloff=3     "Show next 3 lines while scrolling"

"----Indents & Movement----"
set tabstop=4                   "1 tab == 4 spaces"
set shiftwidth=4                "< and > == 4 spaces"
set expandtab                   "Use spaces with tab"
set nowrap                      "Allow lines to go off screen"
set foldmethod=indent           "Will create folds under indents"

"----Searching----"
set smartcase           "Ignore case if all lower case, otherwise do not"
set magic               "Adds regex to seaching"
set incsearch           "Incremental searching using /"
set path+=**            "Search down into all subfolders & allow fuzzy finding"
set wildmenu            "Display files when tab completing"

"----Remove sounds----"
set noerrorbells        "Remove that annoying sound"

"----Backups----"
"^= Makes vim check this first. // means save dir info
set backupdir^=$HOME/.vim/backups// "Set backup file backup dir
set directory^=$HOME/.vim/backups// "Sets swap file backup dir"
set undodir^=$HOME/.vim/undo//      "Sets undo dir"

"----Colorscheme----"
colo gruvbox

"----Keybindings----"
let mapleader = ","
nnoremap ; :
"--Saving--"
nnoremap <leader>w :w<cr>
nnoremap <leader>q :qa<cr>
"--Text movement--"
nnoremap <C-j> i<cr><esc>
"--Files--"
nnoremap <leader>ff :NERDTreeToggle<cr>

"----Code Specific----"
"--Latex--"
function! Update_pdf ()
   silent exec "!pdflatex %" | redraw!
endfunction
au BufWritePost *.tex call Update_pdf()

"--Python--"
set textwidth=79
au BufNewFile,BufRead *.py set fileformat=unix
hi BadWhitespace ctermbg=red
au BufWritePost *.py call flake8#Flake8()

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

"----Plugin Configurations----"
"--airline bar--"
let g:airline_theme='gruvbox'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.maxlinenr = ' ﴳ'
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_skip_empty_sections = 1

"--nerdtree--"
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = '20'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | endif
autocmd BufEnter * NERDTreeMirror
"--gitgutter--"
let g:gitgutter_async=0
highlight clear SignColumn
