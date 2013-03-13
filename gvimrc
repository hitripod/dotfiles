colors torte

if &background == "dark"
    hi normal guibg=black guifg=white
endif

" Windows setting
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Consolas\ 9
  elseif has("gui_win32")
    set guifont=Consolas:h9:cANSI
  endif
  au GUIEnter * simalt ~x "x on an English Windows version. n on a French one
endif

"if has("gui_macvim")
"   " disable the original Cmd-T (open new tab)
"   macmenu &File.New\ Tab key=<nop>
"   " map Cmd-T to the CommandT plugin
"   map <D-t> :CommandT<CR>
"endif
