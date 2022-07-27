if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'rhysd/vim-clang-format'
Plug 'ap/vim-buftabline'
" Plug 'fcpg/vim-osc52'
" Plug 'morhetz/gruvbox'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'jremmen/vim-ripgrep'
Plug 'rhysd/conflict-marker.vim'

call plug#end()

let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'
highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

set background=light
" colorscheme PaperColor
let g:gruvbox_contrast_dark = 'medium'
set bg=dark

let g:tmuxline_powerline_separators = 0
let g:clang_format#detect_style_file
let g:clang_format#command = 'clang-format-9'
let g:clang_format#auto_format_on_insert_leave = 1

" colorscheme onedark
set relativenumber
syntax on
set laststatus=2
set lcs+=space:·
set list


" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set hidden
" colorscheme gruvbox

set termguicolors
colorscheme catppuccin_frappe

map <C-n> :NERDTreeToggle<CR>

let mapleader = "\<Space>"

nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
map <C-p> :call fzf#run(fzf#wrap({'source': 'fd --hidden --exclude ".git" .', 'options': '--preview "bat --style=numbers --color=always --line-range :500 {}"'}))<CR>

" xmap <F7> y:Oscyank<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
"nmap <silent> gd :call CocActionAsync('jumpDefinition')
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap jj <ESC>

nnoremap <silent> <Leader><Leader> :source ~/.config/nvim/init.vim<cr>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

