
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

" gutentags cache dir
let g:gutentags_cache_dir = $HOME .'/.vim/gutentags'

" ale linter configuration
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['pylint', 'bandit', 'reorder-python-imports'] }

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'justinmk/vim-sneak'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'dense-analysis/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'sillybun/vim-repl'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/vimproc.vim'

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
