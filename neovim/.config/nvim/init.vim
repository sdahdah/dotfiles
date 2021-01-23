call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
call plug#end()


" Line numbers
set number
" 80 Character limit
set colorcolumn=80
" Enable mouse
set mouse=a
" Highlight current line
set cursorline
" Show trailing whitespace
set list listchars=nbsp:¬,tab:\|\ ,extends:»,precedes:«,trail:·
" Disable wrapping
set nowrap
" Indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" True colors
set termguicolors

" TaskJuggler comment string
autocmd FileType tjp setlocal commentstring=#\ %s
