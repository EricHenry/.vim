" Set compatibility to Vim only.
set nocompatible

" For plug-ins to load correctly.
filetype plugin indent on

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" -- Color Schemes
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'fratajczak/one-monokai-vim'
Plug 'connorholyday/vim-snazzy'

Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-speeddating'
Plug 'jreybert/vimagit'
Plug 'jceb/vim-orgmode'
Plug 'Lenovsky/nuake'
"Plug 'ervandew/supertab'

" Syntax highlighting
Plug 'andys8/vim-elm-syntax', { 'for': ['elm'] }
Plug 'derekwyatt/vim-scala'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Map <leader> to `,`
"let mapleader=","
noremap <Space> <Nop>
let mapleader=" "

" Map Local Leader to '\'
let maplocalleader="\\"

" remap terminal escape
":tnoremap <Esc> <C-\><C-n>

" Helps force plug-ins to load correctly when it is turned back on below.
"filetype off

" Turn on syntax highlighting.
syntax on

" 
" -------- Color scheme config - START ---------- "
"
set termguicolors
set t_Co=256

colorscheme snazzy
"colorscheme one_monokai

" Dracula
"colorscheme dracula

" -- Seoul256 Dark --
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
"let g:seoul256_background = 234
"colo seoul256
"set background=dark

" -- Seoul256 Light --
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
"let g:seoul256_background = 256
"colo seoul256-light
"set background=light
" 
" -------- Color scheme config - END ---------- "
"

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

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
"set lcs+=space:

" Show line numbers
set number
" Show relative line numbers
set relativenumber

" Set status line display
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

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

"-- FOLDING --
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

" -- fzf mappings --
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
"autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" -- Rg mappings --
nnoremap <Leader>f :Rg<CR>

" -- Polyglot --
let g:polyglot_disabled = ['elm', 'scala']

" -------- Coc config - START ---------- "
"
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

"
" -------- Coc config - END ---------- "


" -------- SCALA config - START ---------- "
"
" Comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

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
"
" -------- SCALA config - END ---------- "


" -------- Airline config - START---------- "
"
" Coc Config
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
"
" -------- Airline config - END ---------- "
"
