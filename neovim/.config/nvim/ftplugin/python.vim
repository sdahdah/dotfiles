if expand('%:p') =~# '.*/control_design'
    let g:lsp_settings = {
    \   'pyls-all': {
    \     'workspace_config': {
    \       'pyls': {
    \         'plugins': {
    \           'rope': {'enabled': v:false},
    \           'pylint': {
    \             'enabled': v:false,
    \             'args': ['--rcfile=~/.config/nvim/ftplugin/control_design_pylint'],
    \            },
    \           'pyflakes': {'enabled': v:false},
    \           'mccabe': {'enabled': v:false},
    \           'pycodestyle': {
    \             'enabled': v:true,
    \             'maxLineLength': 120,
    \             },
    \           'pydocstyle': {'enabled': v:false},
    \           'autopep8': {'enabled': v:false},
    \           'yapf': {'enabled': v:true},
    \         },
    \       },
    \     },
    \   },
    \}
else
    let g:lsp_settings = {
    \   'pyls-all': {
    \     'workspace_config': {
    \       'pyls': {
    \         'plugins': {
    \           'rope': {'enabled': v:true},
    \           'pyflakes': {'enabled': v:false},
    \           'mccabe': {'enabled': v:false},
    \           'pycodestyle': {
    \             'enabled': v:true,
    \             },
    \           'pydocstyle': {'enabled': v:true},
    \           'autopep8': {'enabled': v:false},
    \           'yapf': {'enabled': v:true},
    \           'pyls_isort': {'enabled': v:true},
    \           'pyls_mypy': {
    \             'enabled': v:true,
    \             'live_mode': v:false,
    \           },
    \         },
    \       },
    \     },
    \   },
    \}
    let g:lsp_log_verbose = 1
    let g:lsp_log_file = expand('~/vim-lsp.log')
endif

setlocal foldmethod=indent
setlocal foldlevel=99
