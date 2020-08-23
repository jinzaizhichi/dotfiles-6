function! vimrc#on_insert_enter()
  if !exists("b:win_ime_con_is_insert")
    return
  endif
  if b:win_ime_con_is_insert == 0
    if b:win_ime_con_is_active == 1
       call _activate_ime()
    endif
    let b:win_ime_con_is_insert = 1
  endif
endfunction

function! vimrc#disable_ime()
  if !exists("b:win_ime_con_is_insert")
    return
  endif
  if b:win_ime_con_is_insert
    call _disable_ime(v:true)
  else
    call _disable_ime(v:false)
  endif
  let b:win_ime_con_is_insert = 0
endfunction