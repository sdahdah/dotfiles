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
Plug 'sdahdah/vim-taskjuggler'
" Plug 'natebosch/vim-lsc', {'tag': 'v0.3.1'}
"     " set statusline+=%{LSCServerStatus()}
"     set shortmess-=F
"     let g:lsc_server_commands = {
"         \ 'python': {
"         \     'name': 'pyls',
"         \     'command': 'pyls --check-parent-process',
"         \     'suppress_stderr': v:true,
"         \     },
"         \}
"     " let g:lsc_auto_map = v:true
"     let g:lsc_auto_map = {
"         \ 'GoToDefinition': '<C-]>',
"         \ 'FindReferences': 'gr',
"         \ 'NextReference': '<C-n>',
"         \ 'PreviousReference': '<C-p>',
"         \ 'FindImplementations': 'gI',
"         \ 'FindCodeActions': 'ga',
"         \ 'DocumentSymbol': 'go',
"         \ 'WorkspaceSymbol': 'gS',
"         \ 'ShowHover': 'K',
"         \ 'Completion': 'completefunc',
"         \}
"     " let g:lsc_enable_autocomplete = v:false
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
    " let g:lsp_settings = {
    " \   'pyls-all': {
    " \     'workspace_config': {
    " \       'pyls': {
    " \         'plugins': {
    " \           'rope': {'enabled': v:false},
    " \           'pyflakes': {'enabled': v:false},
    " \           'mccabe': {'enabled': v:false},
    " \           'pycodestyle': {
    " \             'enabled': v:true,
    " \             'maxLineLength': 120,
    " \             },
    " \           'pydocstyle': {'enabled': v:true},
    " \           'autopep8': {'enabled': v:false},
    " \           'yapf': {'enabled': v:true},
    " \         },
    " \       },
    " \     },
    " \   },
    " \}
    "
    let g:lsp_diagnostics_virtual_text_enabled = 0
    let g:lsp_diagnostics_echo_cursor = 1
    let g:lsp_diagnostics_highlights_enabled = 0
    " let g:lsp_preview_float = 0
    " let g:lsp_insert_text_enabled = 0
    " let g:lsp_text_edit_enabled = 0

    nmap gd <plug>(lsp-definition)
    nmap gs <plug>(lsp-document-symbol-search)
    nmap gS <plug>(lsp-workspace-symbol-search)
    nmap gr <plug>(lsp-references)
    nmap gi <plug>(lsp-implementation)
    nmap gt <plug>(lsp-type-definition)
    nmap <leader>rn <plug>(lsp-rename)
    nmap [g <plug>(lsp-previous-diagnostic)
    nmap ]g <plug>(lsp-next-diagnostic)
    nmap K <plug>(lsp-hover)
    nmap <leader>sf <plug>(lsp-document-format)

Plug 'vim-pandoc/vim-pandoc'
    let g:pandoc#folding#level = 999
    let g:pandoc#folding#fdc = 4
    " let g:pandoc#folding#mode = 'stacked'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'vim-python/python-syntax'
    let g:python_highlight_all = 1
    let g:python_highlight_indent_errors = 0
    let g:python_highlight_space_errors = 0
" Plug 'jeetsukumaran/vim-pythonsense'  " Motions
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'ludovicchabant/vim-gutentags'
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
"
" Plug 'fs111/pydoc.vim'
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

    function! DispatchFile(cmd)
        let g:last_dispatcher = split(b:dispatch)[0]
        let g:last_file = expand('%p')
        let g:last_cmd = a:cmd
        execute a:cmd " " g:last_dispatcher g:last_file
    endfunction

    function! DispatchLast()
        execute g:last_cmd " " g:last_dispatcher g:last_file
    endfunction

    map <Leader>df :call DispatchFile("Dispatch")<CR>
    map <Leader>dF :call DispatchFile("Dispatch!")<CR>
    map <Leader>ds :call DispatchFile("Start")<CR>
    map <Leader>dS :call DispatchFile("Start!")<CR>
    map <Leader>dd :call DispatchLast()<CR>
Plug 'radenling/vim-dispatch-neovim'

" Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
" Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'chrisbra/csv.vim'
Plug 'liuchengxu/vista.vim'
    let g:vista_stay_on_open = 0
    let g:vista_executive_for = {
      \ 'python': 'vim_lsp',
      \ }
    map <Leader>vv :Vista!!<CR>
    map <Leader>vf :Vista focus<CR>
Plug 'goerz/jupytext.vim'
" Plug 'chiefnoah/neuron-v2.vim'
Plug 'fiatjaf/neuron.vim'

Plug 'junegunn/goyo.vim'
    " let g:goyo_height=100
    " let g:goyo_linenr=1
" Plug 'rktjmp/lush.nvim'

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
Plug 'tomasr/molokai'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'preservim/vim-colors-pencil'
Plug 'ackyshake/Spacegray.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'haishanh/night-owl.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'jaredgorski/SpaceCamp'
Plug 'robertmeta/nofrils'
    let g:nofrils_strbackgrounds=0
    let g:nofrils_heavycomments=1
    let g:nofrils_heavylinenumbers=1
Plug 'danilo-augusto/vim-afterglow'
Plug 'dikiaap/minimalist'
Plug 'aonemd/kuroi.vim'
Plug 'fcpg/vim-fahrenheit'

" Treesitter schemes
Plug 'sainnhe/sonokai'
Plug 'Iron-E/nvim-highlite'
Plug 'mhartington/oceanic-next'
Plug 'glepnir/zephyr-nvim'
Plug 'vigoux/oak'
Plug 'folke/tokyonight.nvim'
Plug 'fenetikm/falcon'

Plug 'bluz71/vim-nightfly-guicolors'
Plug 'ishan9299/modus-theme-vim'
Plug 'PHSix/nvim-hybrid'
Plug 'ray-x/aurora'
" Plug 'olimorris/onedark.nvim'
Plug 'DilanGMB/nightbuddy'
Plug 'folke/tokyonight.nvim'
Plug 'ajmwagar/vim-deus'
Plug 'dguo/blood-moon', {'rtp': 'applications/vim'}
Plug 'vim-scripts/vylight'

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
" Hybrid line numbering
" set number relativenumber
" True colors
set termguicolors
" Make escape work in terminal
tnoremap <Esc> <C-\><C-n>
" Output the current syntax group
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
" Set colour scheme
set background=dark
colorscheme falcon
" colorscheme blood-moon
" colorscheme lucid

augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    " autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber
    " allows you to use Ctrl-c on terminal window
    " autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END
