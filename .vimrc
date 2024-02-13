syntax on
color desert
nnoremap <F11> :tabp<CR>
nnoremap <F12> :tabn<CR>
set number
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:OmniSharp_server_path = '/opt/dotnet/omnisharp-roslyn/OmniSharp'
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_start_server = 1
let g:OmniSharp_server_stdio = 1
let g:clang_library_path='/usr/lib/libclang.so'

call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'OmniSharp/omnisharp-vim'
Plug 'xavierd/clang_complete'

call plug#end()

" NerdTree
map <F8> :NERDTreeToggle<CR>

map <C-S-Up>   :m -2<CR>gv=gv
map <C-S-Down> :m +1<CR>gv=gv

" OmniSharp autocomplete dialog
inoremap <expr> <Tab> pumvisible() ? '<C-n>' : getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'
nnoremap <C-o><C-u> :OmniSharpFindUsages<CR>
nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>
nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>
nnoremap <C-o><C-r> :!dotnet run
