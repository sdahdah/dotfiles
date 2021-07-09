call plug#begin(stdpath('data') . '/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
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
Plug 'vim-pandoc/vim-pandoc'
    let g:pandoc#folding#level = 999
    let g:pandoc#folding#fdc = 4
    " let g:pandoc#folding#mode = 'stacked'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Python
" Plug 'vim-python/python-syntax'
"     let g:python_highlight_all = 1
"     let g:python_highlight_indent_errors = 0
"     let g:python_highlight_space_errors = 0
" Plug 'jeetsukumaran/vim-pythonsense'  " Motions
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
"     let g:pydocstring_formatter = 'numpy'
" Plug 'fisadev/vim-isort'
" Plug 'fs111/pydoc.vim'
" Plug 'jmcantrell/vim-virtualenv'

" Plug 'ludovicchabant/vim-gutentags'
Plug 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_auto_colors = 0
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"     let g:deoplete#enable_at_startup = 1
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
" Plug 'liuchengxu/vista.vim'
"     let g:vista_stay_on_open = 0
"     let g:vista_executive_for = {
"       \ 'python': 'vim_lsp',
"       \ }
"     map <Leader>vv :Vista!!<CR>
"     map <Leader>vf :Vista focus<CR>
" Plug 'goerz/jupytext.vim'
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
Plug 'Matsuuu/pinkmare'
Plug 'tomasiser/vim-code-dark'
Plug 'Yagua/nebulous.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'elianiva/gruvy.nvim'
Plug 'kuznetsss/meadow-nvim'

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
" colorscheme pencil

augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    " autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber
    " allows you to use Ctrl-c on terminal window
    " autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END

lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = false,
    },
}
EOF

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<Leader>sD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>sr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Leader>sa', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>se', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>sq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<Leader>sf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

nvim_lsp.pylsp.setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
        pylsp = {
            plugins = {
                rope = {
                    enabled = true,
                },
                pylint = {
                    enabled = false,
                },
                pyflakes = {
                    enabled = false,
                },
                pycodestyle = {
                    enabled = true,
                },
                pydocstyle = {
                    enabled = true,
                },
                autopep8 = {
                    enabled = false,
                },
                yapf = {
                    enabled = true,
                },
                pylsp_isort = {
                    enabled = true,
                },
                pylsp_mypy = {
                    enabled = true,
                    live_mode = false,
                    dmypy = true,
                },
            },
        },
    },
}
EOF
