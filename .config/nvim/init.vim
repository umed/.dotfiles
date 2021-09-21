" vim-plug autoinstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

set number
syntax on
colorscheme onedark
set laststatus=2

set lcs+=space:·
:set list

map <C-n> :NERDTreeToggle<CR>
