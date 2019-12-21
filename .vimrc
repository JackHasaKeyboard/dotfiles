" keyboard {{{
nnoremap ; :

noremap r <C-r>

noremap ; :

nnoremap <C-c> "+y
nnoremap <C-S-c> "+y

noremap <z-b> zj
noremap <z-t> zk

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

nnoremap vv ^vg_
nnoremap gV `[V`]

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

noremap <silent> <C-f> :NERDTreeToggle<CR>

" leader {{{
let mapleader=','

nnoremap <Leader>h :bprev<CR>
nnoremap <Leader>l :bnext<CR>

nnoremap <Leader>b o<Esc>o<Esc>S
nnoremap <Leader>B O<Esc>O<Esc>S
nnoremap <Leader>u o<Esc>O<Esc>S
nnoremap <Leader>U O<Esc>o<Esc>S

nnoremap <Leader>j :join<CR>
nnoremap <Leader>v :ArgWrap<CR>

nnoremap <Leader>w :set wrap!<CR>

nnoremap <Leader>t :TableModeToggle

nnoremap <Leader>= K=J''
nnoremap <Leader>L call setline('.', getline('.') . ';')
" }}}
" }}}

" backup {{{
set nobackup
set nowritebackup

set undofile
set undolevels=1000
set undoreload=10000

set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
" }}}

" buffer {{{
set lazyredraw
" }}}

" syntax {{{
syntax on
filetype indent on

set nohls

set t_Co=256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

setlocal foldmethod=expr
" }}}
