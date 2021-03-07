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
Plug 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_auto_colors = 0
" Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
"     let g:pydocstring_formatter = 'numpy'
" Plug 'fisadev/vim-isort'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"     let g:deoplete#enable_at_startup = 1
Plug 'fs111/pydoc.vim'
Plug 'vim-test/vim-test'
    " Disable slow tests for file only
    " let test#python#pytest#options = {
    "   \ 'file': '-k-slow',
    " \}
    map <Leader>tn :TestNearest<CR>
    map <Leader>tf :TestFile<CR>
    map <Leader>ts :TestSuite<CR>
    map <Leader>tl :TestLast<CR>
    map <Leader>tv :TestVisit<CR>
" Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
" Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'chrisbra/csv.vim'

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
Plug 'ayu-theme/ayu-vim'
    " let ayucolor="light"
    " let ayucolor="mirage"
    let ayucolor="dark"
Plug 'ulwlu/elly.vim'
Plug 'felipec/vim-felipec'

Plug 'vim-scripts/pyte'
Plug 'vim-scripts/eclipse.vim'
Plug 'vim-scripts/AutumnLeaf'
Plug 'vim-scripts/ironman.vim'
Plug 'vim-scripts/nuvola.vim'
Plug 'vim-scripts/simpleandfriendly.vim'
Plug 'vim-scripts/buttercream.vim'

Plug 'chriskempson/base16-vim'

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
" Listchars and wrap characters
set list listchars=nbsp:¬,tab:\|\ ,extends:»,precedes:«,trail:·
let &showbreak = '↳ '
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
" Make escape work in terminal
tnoremap <Esc> <C-\><C-n>
" Set colour scheme
set background=dark
colorscheme lucid
