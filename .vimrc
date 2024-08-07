syntax on
color desert
nnoremap <F11> :tabp<CR>
nnoremap <F12> :tabn<CR>
set number
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab
set cursorline

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'OmniSharp/omnisharp-vim'
Plug 'xavierd/clang_complete'
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" NerdTree
map <F8> :NERDTreeToggle<CR>

map <C-S-Up>   :m -2<CR>gv=gv
map <C-S-Down> :m +1<CR>gv=gv

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nmap <silent> <C-N> :cn<CR>zv
nmap <silent> <C-P> :cp<CR>zv

