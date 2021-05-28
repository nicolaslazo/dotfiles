"
"	 _    ___                       
"	| |  / (_)___ ___     __________
"	| | / / / __ `__ \   / ___/ ___/
"	| |/ / / / / / / /  / /  / /__  
"	|___/_/_/ /_/ /_/  /_/   \___/  
"	                                
"

set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=2
syntax on
set ts=4 sw=4
set encoding=utf-8
set hlsearch
set ignorecase
set smartcase
set number
hi MatchParen cterm=underline,bold ctermbg=none ctermfg=none

" python code folding
hi Folded ctermbg=none ctermfg=none
nnoremap <space> za
vnoremap <space> zf

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" nice status line
set laststatus=2
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=%{StatuslineGit()}
set statusline+=\ %t\                   " short file name
set statusline+=%M                        " modified [+] flag
set statusline+=%=                          " right align
set statusline+=%{gutentags#statusline()}\ 
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}\ 
set statusline+=%#CursorLine#   " colour
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage

" gutentags cache dir
let g:gutentags_cache_dir = $HOME .'/.vim/gutentags'

" ale linter configuration
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['pylint', 'bandit', 'reorder-python-imports', 'pyflakes', 'pycodestyle'] }
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" youcompleteme configuration
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  { 'c,cpp,objc': [ 're!\w{3}', '_' ], }
let g:ycm_clangd_args=['--header-insertion=never']

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'justinmk/vim-sneak'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'dense-analysis/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/vimproc.vim'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/SimpylFold'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" enable fzf
source /usr/share/doc/fzf/examples/fzf.vim

" open tags explorer
nmap <F8> :TagbarToggle<CR>
