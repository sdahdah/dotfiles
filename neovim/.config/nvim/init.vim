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
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'nathanaelkane/vim-indent-guides'
"     let g:indent_guides_enable_on_vim_startup = 1
"     let g:indent_guides_start_level = 2
"     let g:indent_guides_guide_size = 1
"     let g:indent_guides_auto_colors = 0
" Colorschemes
Plug 'agude/vim-eldar'
Plug 'cseelus/vim-colors-lucid'
Plug 'jpo/vim-railscasts-theme'
Plug 'tpope/vim-vividchalk'
Plug 'sjl/badwolf'
Plug 'gruvbox-community/gruvbox'
    let g:gruvbox_contrast_dark = 'hard'
Plug 'yasukotelin/shirotelin'
Plug 'vim-scripts/burnttoast256'
Plug 'w0ng/vim-hybrid'
Plug 'trapd00r/neverland-vim-theme'
Plug 'lodestone/lodestone.vim'
Plug 'mrkn/mrkn256.vim'
Plug 'vim-scripts/synic.vim'

call plug#end()

" Window title
set title
" Line numbers
set number
" 80 character limit
set colorcolumn=80
" Always show sign column
set signcolumn=yes
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
" Make gg and G keep column
set nostartofline
" True colors
set termguicolors
" Set colour scheme
set background=dark
colorscheme lucid

" " Eldar overrides
" highlight SignColumn guibg='#2E3435'
" highlight ColorColumn guibg='#2E3435'
" highlight CursorLine gui=underline
" " highlight IndentGuidesOdd guibg='#2E3435'
" " highlight IndentGuidesEven guibg='#2E3435'
" highlight MatchParen gui=underline guibg=none
