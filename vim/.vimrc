""" APPUNTI
""" ===========================================================================

""" :colorscheme calmbreeze
""" :AirlineTheme angr
""" :AirlineTheme papercolor


""" mappa colori:
""" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

""" visualizza colori attuali
""" :hi

""" Chiudi VIM e tutte le finestre (anche se modificate)
""" :%bd!|q
""" '%' dovrebbe significare "tutto", 'bd' sta pere "Buffer Delete",
""" 'mentre la pipe '|' separa i comandi, come ';' in bash


""" COLORSCHEME
""" ============================================================================

colorscheme calmbreeze

""" GENERALE
""" ============================================================================

""" ricorda l'ultima posizione
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set tabstop=4

set termguicolors

set history=10000
set viminfo+=:10000

""" background
"hi Normal ctermbg=16 ctermfg=15
hi Normal ctermbg=NONE ctermfg=15 guibg=#000000 guifg=#d0d0d0

""" Cursore (funziona solo in gvim)
"hi Curosr NONE
"hi Cursor ctermbg=1 ctermfg=202

""" barra verticale per schermo splittato
hi VertSplit cterm=NONE ctermfg=243 ctermbg=NONE guibg=#787878 guifg=#787878

""" evidenzio riga e colonna corrente
"set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=232
set cursorline
hi CursorLine cterm=NONE ctermbg=233 gui=NONE guibg=#181818

""" abbreviazione di number nu (:set nu)
""" :set nu! abilita disabilita la numerazione
"set number	"numeri normali
"set numberwidth=5
""" ---
"set relativenumber "numeri relativa
""" ---
"set number relativenumber "numeri ibridi
""" ---
""" Passaggio automatico normali/ibridi
""" ----------------------------------------------------------------------------
:set number

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
""" ----------------------------------------------------------------------------
hi LineNr ctermfg=214 gui=NONE guibg=NONE guifg=orange
hi CursorLineNr cterm=bold ctermbg=166 ctermfg=white gui=NONE guibg=#cc6600 guifg=white

""" fa comparire una linea verticale agli 80 caratteri (brutta)
"set colorcolumn=80
"hi ColorColumn NONE
"hi ColorColumn ctermbg=8

""" evidenzio il limite degli 80 caratteri
hi OverLength ctermbg=160 ctermfg=white guibg=#602000 guifg=#d0d0d0
match OverLength /\%81v./

""" visualizza gli spazi, i tab ecc
set list
"set listchars=eol:🟊,tab:▸∙,space:∙,extends:>,precedes:<
set listchars=tab:▸∙,space:∙,extends:⟩,precedes:⟨
hi NonText ctermfg=23 guibg=NONE guifg=#272727 "o 57
hi SpecialKey ctermfg=23 guibg=NONE guifg=#272727 "o 33

""" commenti
hi Comment cterm=italic ctermbg=NONE ctermfg=241 gui=italic guibg=NONE guifg=#686868

""" messaggi, tipo 'file modificato [+]'
hi User1 ctermbg=NONE ctermfg=1 guibg=NONE guifg=red
""" linea gruppo chiuso
hi Folded ctermbg=238 guibg=#272727
""" corrispondeza parentesi
:hi MatchParen cterm=bold ctermbg=118 ctermfg=16 guifg=#000000 guibg=#8AE234 "o ctermfg=22

""" STATUS LINE
""" ============================================================================

""" un %N* (dove N=1..9) indica il gruppo userN per inmpostare un colore
""" un %* dopo il flag reimposta il colore di default
""" un "\ " indica uno spazio
"set laststatus=2
"set statusline=
"set statusline+=\ \-\-\ %{&ff}	" formato file
"set statusline+=%y				" tipo di file
"set statusline+=\ %F			" nome file
"set statusline+=\ %1*%m%*		" se il file e' modificato
"set statusline+=\ %2*%r%*		" se il file e in sola lettura
"set statusline+=%=				" spazio flessibile
"set statusline+=%-14.(%l,%c%V%)	" currentLine,[correntColumn|virtualColum]
								" 14 caratteri allineati a sinistra (-)
"set statusline+=\ %P			" posizione in percentuale sulla pagina

""" Status Line COLOR
""" Con la prima dichiarazione disabilito gli stili (tipo bold)
"hi StatusLine NONE
"hi StatusLine ctermbg=NONE ctermfg=255

""" statusline non attiva (finestra splittata)
"hi StatusLineNC NONE
"hi StatusLineNC ctermbg=NONE ctermfg=237

""" MISCELANIA
""" ============================================================================

"set background=dark
set mouse=a
set nocompatible
set tabstop=4
set showcmd
set title

""" MAPPATURA TASTI
""" ============================================================================

""" newline premendo due volte invio
nmap <CR><CR> o<ESC>

""" VIM PLUG
""" ============================================================================

call plug#begin()

"Plug 'obcat/vim-sclow'
Plug 'wfxr/minimap.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

call plug#end()

""" VIM AIRLINE
""" ============================================================================

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

":let g:airline_theme='badwolf'

""" MINIMAP
""" ============================================================================

let g:minimap_width = 10
let g:minimap_auto_start = 0
let g:minimap_auto_start_win_enter = 1











