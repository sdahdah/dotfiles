call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-commentary'
    autocmd FileType tjp setlocal commentstring=#\ %s
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-projectionist'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/Colorizer'
Plug 'lervag/vimtex'
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_indent_enabled = 0
Plug 'dense-analysis/ale'
    let g:ale_echo_msg_format="[%linter% %code%] %s"
" Plug 'jpalardy/vim-slime'
"     let g:slime_target = "dtach"
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
" Plug 'romainl/vim-cool'
Plug 'mhinz/vim-startify'
    let g:startify_custom_header = 'startify#pad(startify#fortune#quote())'
Plug 'tpope/vim-dispatch'
    let g:dispatch_no_maps = 1

    autocmd FileType python let b:dispatch = 'python %'

    function! DispatchFile()
        let g:last_dispatcher = split(b:dispatch)[0]
        let g:last_file = expand('%p')
        execute "Dispatch " g:last_dispatcher g:last_file
    endfunction

    function! DispatchLast()
        execute "Dispatch " g:last_dispatcher g:last_file
    endfunction

    " map <Leader>df :Dispatch<CR>
    map <Leader>df :call DispatchFile()<CR>
    map <Leader>dl :call DispatchLast()<CR>
Plug 'radenling/vim-dispatch-neovim'

" Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
" Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'chrisbra/csv.vim'
Plug 'liuchengxu/vista.vim'
    " let g:vista#renderer#enable_icon = 1
    " let g:vista_icon_indent = ["▸ ", ""]
    map <Leader>vv :Vista!!<CR>
Plug 'goerz/jupytext.vim' 
" Plug 'chiefnoah/neuron-v2.vim'
Plug 'fiatjaf/neuron.vim'

Plug 'junegunn/goyo.vim'
    " let g:goyo_height=100
    " let g:goyo_linenr=1

" Colorschemes
Plug 'agude/vim-eldar'
Plug 'cseelus/vim-colors-lucid'
Plug 'jpo/vim-railscasts-theme'
Plug 'tpope/vim-vividchalk'
Plug 'sjl/badwolf'
    let g:badwolf_darkgutter = 1
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
Plug 'vim-scripts/AutumnLeaf'
Plug 'vim-scripts/nuvola.vim'
Plug 'vim-scripts/buttercream.vim'
" Plug 'chriskempson/base16-vim'
Plug 'xero/sourcerer.vim'
" Plug 'atelierbram/vim-colors_atelier-schemes'
" Plug 'atelierbram/Base4Tone-vim'
" Plug 'atelierbram/Base2Tone-vim'
Plug 'dracula/vim'
Plug 'h3xx/vim-late_evening'
Plug 'jnurmine/Zenburn'
Plug 'vim-scripts/xoria256.vim'
" Plug 'jeffkreeftmeijer/vim-dim'
Plug 'romainl/Apprentice'
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'nanotech/jellybeans.vim'
Plug 'sainnhe/edge'

" Treesitter schemes
Plug 'sainnhe/sonokai'
Plug 'Iron-E/nvim-highlite'
Plug 'mhartington/oceanic-next'
Plug 'glepnir/zephyr-nvim'
Plug 'vigoux/oak'
Plug 'folke/tokyonight.nvim'
Plug 'fenetikm/falcon'

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
set breakindent
set formatoptions=l
set lbr
set wrap
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

augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    " autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber
    " allows you to use Ctrl-c on terminal window
    " autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END
