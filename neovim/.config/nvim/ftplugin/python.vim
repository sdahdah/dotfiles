if expand('%:p') =~# '.*/control_design'
    let g:lsp_settings = {
    \   'pyls-all': {
    \     'workspace_config': {
    \       'pyls': {
    \         'plugins': {
    \           'rope': {'enabled': v:false},
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
    \           'rope': {'enabled': v:false},
    \           'pyflakes': {'enabled': v:false},
    \           'mccabe': {'enabled': v:false},
    \           'pycodestyle': {
    \             'enabled': v:true,
    \             },
    \           'pydocstyle': {'enabled': v:false},
    \           'autopep8': {'enabled': v:false},
    \           'yapf': {'enabled': v:true},
    \         },
    \       },
    \     },
    \   },
    \}
endif
