" ##############################################
" # Init
" ##############################################

"set shell=/bin/zsh
set shell=/usr/local/bin/fish
let mapleader = "\<Space>"

" Clear filetype flags before changing runtimepath to force Vim to reload them.
""filetype off
"set runtimepath+=$GOROOT/misc/vim
"filetype plugin indent off

" Set compatibility to Vim only.
set nocompatible

" For plug-ins to load correctly.
syntax on
filetype plugin on
filetype plugin indent on

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')


" ##############################################
" # Plugins
" ##############################################

" Color Schemes
Plug 'junegunn/seoul256.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'sainnhe/sonokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/base16-vim'

" GUI enhancements
Plug 'itchyny/lightline.vim'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
Plug 'andys8/vim-elm-syntax', { 'for': ['elm'] }   " Elm
Plug 'dag/vim-fish'                                " fish
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Golang
Plug 'neovimhaskell/haskell-vim'                   " Haskell
Plug 'pbrisbin/vim-syntax-shakespeare'             " Haskell - YSOD
Plug 'yuezk/vim-js'                                " JavaScript
Plug 'godlygeek/tabular'                           " Markdown support
Plug 'plasticboy/vim-markdown'                     " Markdown
Plug 'vim-python/python-syntax'                    " Python
Plug 'reasonml-editor/vim-reason-plus'             " ReasonML
Plug 'rust-lang/rust.vim'                          " Rust
Plug 'derekwyatt/vim-scala'                        " Scala
Plug 'leafgarland/typescript-vim'                  " TypeScript
Plug 'maxmellon/vim-jsx-pretty'                    " TSX / JSX

" tools
Plug 'jreybert/vimagit'
Plug 'scrooloose/nerdcommenter'
Plug 'voldikss/vim-floaterm'
Plug 'kassio/neoterm'
Plug 'wincent/terminus'
Plug 'vimwiki/vimwiki'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ##############################################
" # Colors
" ##############################################

" deal with colors
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif
set background=dark
let base16colorspace=256
"let g:base16_shell_path="~/dev/others/base16/templates/shell/scripts/"
colorscheme base16-gruvbox-dark-hard
syntax on
hi Normal ctermbg=NONE

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Brighter comments
"call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")


"syntax on
"set t_Co=256
"set cursorline

"" Important!!
"if has('termguicolors')
  "set termguicolors
"endif

"" The configuration options should be placed before `colorscheme sonokai`.
"let g:sonokai_style = 'andromeda'
"let g:sonokai_enable_italic = 1
"let g:sonokai_disable_italic_comment = 1

"colorscheme sonokai

" -- one half dark --
"colorscheme onehalflight
"colorscheme onehalfdark
" lightline
" let g:lightline.colorscheme='onehalfdark'

" -- Snazzy --
"set termguicolors
"set t_Co=256
"set background=dark
"colorscheme snazzy

" -- GruvBox --
" Important!!
"if has('termguicolors')
  "set termguicolors
"endif

" For dark version.
"set background=dark

" For light version.
"set background=light

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
"let g:gruvbox_material_background = 'hard'

"colorscheme gruvbox-material

" -- Seoul256 Dark --
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
"let g:seoul256_background = 235
"colo seoul256

" -- Seoul256 Light --
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
"let g:seoul256_background = 256
"colo seoul256-light
"set background=light

" ##############################################
" # FZF
" ##############################################

"nnoremap <C-p> :Files<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
"autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" -- Rg mappings --
nnoremap <Leader>f :Rg<CR>


" ##############################################
" # Coc 
" ##############################################

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-reason',
  \ 'coc-prettier',
  \ 'coc-marketplace',
  \ 'coc-explorer',
  \ 'coc-eslint',
  \ 'coc-tsserver',
  \ 'coc-metals',
  \ 'coc-json',
  \ 'coc-floaterm',
  \ 'coc-go',
  \ 'coc-python',
  \ ]


" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)


" Keybindings
nmap <silent> <leader>s <Plug>(coc-fix-current)
nmap <silent> <leader>S <Plug>(coc-codeaction)
nmap <silent> <leader>g :call CocAction('doHover')<CR>
nmap <silent> <leader>p :call CocActionAsync('format')<CR>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>

" Coc Explorer
nnoremap <silent> <space>e  :<C-u>CocCommand explorer<cr>
 
" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ##############################################
" # GoLang config 
" ##############################################
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_doc_popup_window = 1
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" ##############################################
" # SCALA config 
" ##############################################

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Reveal current current class (trait or object) in Tree View 'metalsBuild'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>


" ##############################################
" # Lightline 
" ##############################################

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  "let modified = &modified ? ' +' : ''
  "return filename . modified
  return filename
endfunction

let g:lightline = {
      \ 'colorscheme': 'sonokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \
      \ }

" ##############################################
" # Floaterm
" ##############################################

""" Configuration example
let g:floaterm_keymap_prev   = '<Leader>h'
let g:floaterm_keymap_next   = '<Leader>l'
let g:floaterm_keymap_hide   = '<F10>'
let g:floaterm_keymap_new    = '<Leader>J'
let g:floaterm_keymap_toggle = '<Leader>j'

"let g:floaterm_wintype  = 'normal'
"let g:floaterm_height   = 0.3
"let g:floaterm_position = 'bottom'


" ##############################################
" # VimWiki 
" ##############################################

let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_folding = 'custom'

"make sure markdown files used by vimwiki are set to markdown file types
au BufRead,BufNewFile *.md set filetype=markdown


" ##############################################
" # Editor Settings 
" ##############################################
set noshowmode
"set noshowcmd
set cmdheight=1

" Permanent undo
set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.git,.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" folding
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

" Automatically wrap text that extends beyond the screen length.
set wrap

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" don't add a new line at the end of files
set nofixendofline

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" line numbers
set number
set relativenumber

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^><F23>

"markdown
let g:vimwiki_global_ext = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1

" ##############################################
" # Autocommands
" ##############################################

" Comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" Help filetype detection
autocmd BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx


" ##############################################
" # Footer
" ##############################################
