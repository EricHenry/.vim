" Set compatibility to Vim only.
set nocompatible

" For plug-ins to load correctly.
filetype plugin indent on
 
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" -- Color Schemes
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim'
Plug 'endel/vim-github-colorscheme'
Plug 'dikiaap/minimalist'
Plug 'rakr/vim-one'

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jceb/vim-orgmode'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-speeddating'
Plug 'ervandew/supertab'
Plug 'andys8/vim-elm-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" Color scheme
" -- Minimalist
"set t_Co=256
"colorscheme minimalist

" -- GitHub --
"colorscheme github

" -- Dracula --
"  colorscheme dracula
"
" -- OceanicNext --
" for vim 8
"if (has("termguicolors"))
" set termguicolors
"endif
"colorscheme OceanicNext
"
" -- Seoul256 Dark --
let g:seoul256_background = 233
colo seoul256

" -- Seoul256 Light --
"let g:seoul256_background = 256
"colo seoul256
"set background=light
"
" -- One  --
"colorscheme one
" set background=dark " for the dark version
" set background=light " for the light version

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
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set lcs+=space:·

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

" -- Polyglot -- 
"let g:polyglot_disabled = ['elm']
