" Eirik Furuseth
" .vimrc
syntax enable
set modelines=5
set number
set nowrap
set mouse-=a
set nocompatible
set noshowmode
set laststatus=2
set background=dark

" indent
set shiftwidth=4
set shiftround      " Indents are rounded to nearest shiftwidth
set softtabstop=4
set expandtab
set smarttab
set autoindent


" Split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remaps
map :Q :q
map :W :w
map :WQ :wq

" Untested
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-fugitive'                   " Git
    Plug 'junegunn/rainbow_parentheses.vim'     " Rainbow parentheses
    Plug 'w0rp/ale'                             " Syntax checking
    Plug 'kien/ctrlp.vim'                       " Fuzzy file search
    Plug 'scrooloose/nerdtree'                  " Tree-view file finding
    Plug 'itchyny/lightline.vim'                " Modeline
    Plug 'dkasak/gruvbox'                       " Theme
    Plug 'rakr/vim-one'                         " Theme
    Plug 'easymotion/vim-easymotion'            " Movement in buffer
    Plug 'tpope/vim-surround'                   " Easily change around objects
    Plug 'SirVer/ultisnips'                     " Snippets
    Plug 'honza/vim-snippets'                   " Snippets library
    Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
    Plug 'junegunn/fzf.vim'
    Plug 'gryf/kickass-syntax-vim'
    Plug 'airblade/vim-rooter'
    Plug 'liuchengxu/vim-which-key'
    Plug 'AckslD/nvim-whichkey-setup.lua'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
call plug#end()

colorscheme gruvbox

" ==== Deoplete
let g:deoplete#enable_at_startup = 1

" ==== Vim which key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>


" ==== VimRooter
let g:rooter_patterns = ['.git', 'Makefile']

" ==== Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s2)
" nmap / <Plug>(easymotion-sn)
" nmap <space> <Plug>(easymotion-sn)


" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$','\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store', '.class']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>

" === Lightline
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function':{
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }

" ==== YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ymc_extra_conf.py"
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion=[]
let g:ycm_min_num_of_chars_for_completion = 1
