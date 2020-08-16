
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif


call plug#begin("~/.config/nvim/plugged")
    Plug 'goerz/jupytext.vim'
    Plug 'junegunn/vim-emoji'
    Plug 'scrooloose/nerdtree'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Code commenter
    Plug 'scrooloose/nerdcommenter'

    " Better file browser
    Plug 'scrooloose/nerdtree'
    Plug 'jeetsukumaran/vim-pythonsense'
    Plug 'Townk/vim-autoclose'
    Plug 'sheerun/vim-polyglot'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'dense-analysis/ale'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-utils/vim-man'
    "Treinamento Vim
    Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
    " Class/module browser
    Plug 'majutsushi/tagbar'
    "dockerfile
    Plug 'ekalinin/Dockerfile.vim'
    "Snippets
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'honza/vim-snippets'
    Plug 'garbas/vim-snipmate'
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Pending tasks list
    Plug 'fisadev/FixedTaskList.vim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    " Just to add the python go-to-definition and similar features, autocompletion
    " from this plugin is disabled
    Plug 'davidhalter/jedi-vim'

    "colorscheme
    Plug 'gruvbox-community/gruvbox'
    "Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

autocmd BufWritePre *.py :%s/\s\+$//e
set shell=/bin/bash 

"mappings
    nnoremap <silent> // :noh<CR>
    nnoremap <space> za
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
    let mapleader=" "
    nnoremap <Leader>+ :vertical resize +15<CR>
    nnoremap <Leader>- :vertical resize -15<CR>
    map <silent> <leader>md :MarkdownPreview<CR>
    map <silent> <leader>cp :call Captura()<CR>
    nmap <silent> gd <Plug>(coc-definition)
    nmap <leader>rn <Plug>(coc-rename)
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    let g:user_emmet_leader_key=' '

"settings
    syntax on
    set clipboard=unnamedplus
    set nu
    set incsearch
    set smartcase
    set hlsearch
    set foldmethod=indent
    set foldlevel=99
    set encoding=utf-8
    set nobackup
    set undodir=/home/alexandre/.config/nvim/tmp/undodir
    set undofile
    set noswapfile
    set nowrap
    set noerrorbells
    set clipboard=unnamedplus
    set relativenumber
    
    set colorcolumn=80
    highlight ColorColumn ctermbg=0 guibg=lightgrey

"Filetypes
au BufNewFile,BufRead *.js silent!
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  
au BufNewFile,BufRead *.html silent!
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
    
au BufNewFile,BufRead *.css silent!
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2

au BufNewFile,BufRead *.py 
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set expandtab
  set autoindent
  set fileformat=unix

au BufNewFile,BufRead *.md 
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set expandtab
  set autoindent
  set fileformat=unix

autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2

