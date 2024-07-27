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




""" ----------------------------------------
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
""" ----------------------------------------

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










""" LSP BASH SERVER -----------------------------------------------------------

"vim.api.nvim_create_autocmd('FileType', {
  "pattern = 'sh',
  "callback = function()
    "vim.lsp.start({
      "name = 'bash-language-server',
      "cmd = { 'bash-language-server', 'start' },
    "})
  "end,
"})

""" AUTOCOMPLETAMENTO NVIM-CMP ------------------------------------------------

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['bashls'].setup {
    capabilities = capabilities
  }

  -- -- -- CSS LANGUAGE SERVER -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
  ----Enable (broadcasting) snippet capability for completion
  --local capabilities = vim.lsp.protocol.make_client_capabilities()
  --capabilities.textDocument.completion.completionItem.snippetSupport = true

  --require'lspconfig'.cssls.setup {
    --capabilities = capabilities,
  --}
  --require'lspconfig'.cssls.setup{}

  --require'lspconfig'.cssmodules_ls.setup{}
  --require'lspconfig'.marksman.setup{}
  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

EOF



















