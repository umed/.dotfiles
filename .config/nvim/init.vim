if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rhysd/vim-clang-format'

call plug#end()


let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

let g:tmuxline_powerline_separators = 0
let g:clang_format#detect_style_file

colorscheme onedark
syntax on

set number
set laststatus=2
set lcs+=space:¬∑
:set list
set clipboard+=unnamedplus

map <C-n> :NERDTreeToggle<CR>

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
