let g:quickrun_config = {}
let g:quickrun_config._ = {}
if has('nvim')
  let g:quickrun_config._['runner'] = 'nvimterm'
endif

let g:quickrun_config['cpp'] = {
      \  'command': 'g++',
      \  'cmdopt' : '-std=c++2a -Wall',
      \  'outputter' : 'quickfix',
      \  'outputter/message/log' : 1
      \ }

let g:quickrun_config['typescript'] = {
      \   'type': 'typescript/deno'
      \ }

if has('unix')
  let g:quickrun_config['python'] = {
        \  'command': '/usr/bin/python3',
        \  'outputter' : 'quickfix',
        \ }
else
  let g:quickrun_config['python'] = {
        \  'command': 'python',
        \  'outputter' : 'quickfix',
        \ }
endif
