" vim-plug autoinstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'

" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or latest tag
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" Or build from source code by use yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

set number
syntax on
colorscheme onedark
set laststatus=2

map <C-n> :NERDTreeToggle<CR>
