
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

set guifont=Monaco:h12

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab sw=2

syntax enable
set background=dark
colorscheme solarized

" NERDTree configuration
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

