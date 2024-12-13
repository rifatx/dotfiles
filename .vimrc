syntax on
color desert
set number
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab

set cursorline
highlight CursorLine ctermbg=234

set history=10000

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'xavierd/clang_complete'
Plug 'tpope/vim-fugitive'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" NerdTree
map <F8> :NERDTreeToggle<CR>

" swap lines
map <C-S-Up>   :m -2<CR>gv=gv
map <C-S-Down> :m +1<CR>gv=gv

" coc
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" multiple cursors
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-d>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<A-d>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

nmap <silent> <C-N> :cn<CR>zv
nmap <silent> <C-P> :cp<CR>zv

" tab nav keys
nnoremap <F11> :tabp<CR>
nnoremap <F12> :tabn<CR>

let vimrc_path = trim(system('dirname -z $(realpath ~/.vimrc)'))
execute 'source ' . vimrc_path . "/.vimrc_tagtab"

map <C-g> :TabExpand 1<CR>

