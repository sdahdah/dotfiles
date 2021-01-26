call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-commentary'
    autocmd FileType tjp setlocal commentstring=#\ %s
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'sdahdah/vim-eldar'
Plug 'chrisbra/Colorizer'
Plug 'lervag/vimtex'
    let g:vimtex_view_method = 'zathura'
Plug 'dense-analysis/ale'
    let g:ale_echo_msg_format="[%linter% %code%] %s"
Plug 'jpalardy/vim-slime'
    let g:slime_target = "dtach"
Plug 'vim-python/python-syntax'
    let g:python_highlight_all = 1
    let g:python_highlight_indent_errors = 0
    let g:python_highlight_space_errors = 0
" Plug 'jeetsukumaran/vim-pythonsense'  " Motions
" Plug 'Vimjas/vim-python-pep8-indent'  " Special indent rules
" Plug 'ludovicchabant/vim-gutentags'  " Tags
call plug#end()

" Window title
set title
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
" Reduce async update time for vim-gitgutter
set updatetime=100
" True colors
set termguicolors
" Set colour scheme
colorscheme eldar
