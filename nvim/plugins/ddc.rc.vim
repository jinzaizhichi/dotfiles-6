inoremap <silent><expr> <TAB>
      \ pumvisible() ? '<C-n>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#manual_complete()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

if has('nvim')
  call ddc#custom#patch_global('sources', ['nvim-lsp', 'skkeleton', 'buffer', 'around', 'vsnip', 'file', 'dictionary'])
else
  call ddc#custom#patch_global('sources', ['vim-lsp', 'skkeleton', 'buffer', 'around', 'vsnip', 'file', 'dictionary'])
endif
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_fuzzy'],
      \   'sorters': ['sorter_rank'],
      \   'converters': ['converter_remove_overlap', 'converter_truncate'],
      \ },
      \ 'around': {'mark': 'A'},
      \ 'dictionary': {'matchers': ['matcher_editdistance'], 'sorters': [], 'maxCandidates': 6, 'mark': 'D', 'minAutoCompleteLength': 3},
      \ 'necovim': {'mark': 'neco'},
      \ 'nvim-lsp': {'mark': 'lsp', 'forceCompletionPattern': "\\.|:\\s*|->"},
      \ 'ddc-vim-lsp': {'mark': 'lsp', 'forceCompletionPattern': "\\.|:\\s*|->"},
      \ 'buffer': {'mark': 'B'},
      \ 'file': {'mark': 'F', 'forceCompletionPattern': "/"},
      \ 'vsnip': {'dup': v:true},
      \ 'skkeleton': {
      \   'mark': 'skk',
      \   'matchers': ['skkeleton'],
      \   'sorters': [],
      \   'minAutoCompleteLength': 2,
      \ },
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ 'buffer': {'forceCollect': v:true, 'fromAltBuf': v:true},
      \ 'nvim-lsp': {'useIcon': v:true},
      \ 'dictionary': {'smartCase': v:true},
      \ })
call ddc#custom#patch_global('filterParams', {
      \ 'matcher_fuzzy': {'camelcase': v:true},
      \ 'converter_truncate': {'maxAbbrWidth': 60, 'maxInfo': 500, 'ellipsis': '...'},
      \ })

call ddc#custom#patch_global('specialBufferCompletion', v:true)
call ddc#custom#patch_filetype(
      \ ['denite-filter', 'TelescopePrompt'], 'specialBufferCompletion', v:false
      \ )

call ddc#custom#patch_filetype(['vim', 'toml'], {
      \ 'sources': ['necovim', 'skkeleton', 'buffer', 'around', 'vsnip', 'file', 'dictionary'],
      \ })
call ddc#custom#patch_filetype(
      \ ['zsh'], 'sources', ['zsh']
      \ )
call ddc#custom#patch_filetype(['zsh'], 'sourceOptions', {
      \ 'zsh': {'mark': 'Z'},
      \ })

call ddc#enable()
