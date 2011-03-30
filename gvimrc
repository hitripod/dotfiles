colors torte
set go-=T
set bg=dark
if &background == "dark"
    hi normal guibg=black
    set transp=8
endif
set guifont=Monaco:h14

"if has("gui_macvim")
"   " disable the original Cmd-T (open new tab)
"   macmenu &File.New\ Tab key=<nop>
"   " map Cmd-T to the CommandT plugin
"   map <D-t> :CommandT<CR>
"endif
