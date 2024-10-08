""" APPUNTI
"" =============================================================================

"" ":colorscheme calmbreeze 
"" ":AirlineTheme angr
"" ":AirlineTheme papercolor

"" "mappa colori:
"" "http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

"" "visualizza colori attuali
"" ":hi

"" "Chiudi VIM e tutte le finestre (anche se modificate)
"" ":%bd!|q
"" "%' dovrebbe significare \"tutto\", 'bd' sta pere \"Buffer Delete\",
"" "mentre la pipe '|' separa i comandi, come ';' in bash

""" SETTAGGI GENERICI
"" =============================================================================

set history=10000
set viminfo+=:10000

set termguicolors

set tabstop=4
"" "serve a tabstop
set shiftwidth=0 

set list
set listchars=tab:󰍴,space:󰧟,extends:⟩,precedes:⟨
"" "test per tab	e spazi

set ignorecase
set smartcase

set cursorline
set mouse=a
set nocompatible
set showcmd
set title

""" IMPORTANTE [:help mapleader]
"let mapleader = ","

""" RICORDA L'ULTIMA POSIZIONE .................................................

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""" PASSAGGIO AUTOMATICO NORMALI/IBRIDI ........................................

set number

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

""" CURSORE
"" =============================================================================

"hi iCursor guibg=red
"hi nCursor guibg=white
"set guicursor=i:ver25-iCursor,n:block-nCursor,c:ver25-nCursor

""" MAPPATURA TASTI
"" =============================================================================

"" "Newline premendo due volte invio
nmap <CR><CR> o<ESC>

""" PLUGIN OMNICOMPLITION: SETTAGGI
"" =============================================================================

"" "Enable plugins and load plugin for the detected file type.                  !!!!!! SERVE ANCHE AD ALTRI PLUGIN
filetype plugin on

"" "Enable Omnicomplete features
"set omnifunc=syntaxcompleteComplete

""" PLUG [PLUGINS MANAGER]
"" =============================================================================

call plug#begin()

"Plug 'junegunn/vim-easy-align'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'nathanaelkane/vim-indent-guides'

Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

Plug 'NLKNguyen/papercolor-theme'

Plug 'preservim/nerdcommenter'

Plug 'kshenoy/vim-signature'

call plug#end()

""" SETTAGGI VIM AIRLINE ......................................................

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

""" SETTAGGI INDENT GUIDES ....................................................

"let g:indent_guides_indent_levels = 30
"let g:indent_guides_color_change_percent = 5
"let g:indent_guides_guide_size = 1

""" SETTAGGI TABULAR / VIM-MARKDOWN ...........................................

let g:vim_markdown_folding_disabled = 1

""" SETTAGGI NERDCOMMENTER .....................................................

"" "Create default mappings
let g:NERDCreateDefaultMappings = 1

"" "Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

"" "Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1



""" PACKER [PLUGINS MANAGER]
"" =============================================================================

lua require('plugins')

lua require('overlength').setup({enabled = true, ctermbg = 'red', guibg = '#8B0000', textwidth_mode = 1, default_overlength = 80, grace_length = 1, highlight_to_eol = false, disable_ft = { 'qf', 'help', 'man', 'packer', 'NvimTree', 'Telescope', 'WhichKey' },})



""" SCHEMI E COLORI
"" =============================================================================

""" VILLA PIOVOSA ..............................................................

"source ~/.config/nvim/villa-piovosa.vimrc

""" SCHEMA CARINO ..............................................................

"colorscheme anokha

""" SCHEMA CANDY CODE ..........................................................

"colorscheme candycode
"hi Normal guibg=NONE
"hi NonText guifg=#383838
"hi VertSplit guibg=#202020 guifg=#202020

""" SCHEMA ATTUALE .............................................................

set background=dark
let g:airline_theme='apprentice'
colorscheme PaperColor
hi Normal				 guibg=#1a1615
hi LineNr 				 guibg=NONE
hi NonText				 guibg=NONE		guifg=#302c2b
hi CursorLine			 guibg=#242221
hi VertSplit	gui=NONE guibg=NONE		guifg=#5f8787















