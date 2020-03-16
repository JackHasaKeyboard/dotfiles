" keyboard {{{
noremap ; :

noremap r <C-r>

noremap H ^
noremap L $
noremap K gg
noremap J G

nnoremap <C-c> "+y
nnoremap <C-S-c> "+y

noremap <z-b> zj
noremap <z-t> zk

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <C-o> <C-o>zz

nnoremap vv ^vg_
nnoremap gV `[V`]

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

noremap <silent> <C-f> :NERDTreeToggle<CR><C-w><C-w>

nnoremap p p=`]

nmap ZZ <Nop>
nmap ZQ <Nop>

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

nnoremap <Leader>t :TableModeToggle<CR>

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

" clipboard {{{
set paste
" }}}

" tab {{{
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>

nnoremap <C-S-h> :tabfirst<CR>
nnoremap <C-S-L> :tablast<CR>
" }}}

" line {{{
set guicursor+=i:block-Cursor

set nu

set ts=2 sw=2
set softtabstop=0
" set smartindent
set cindent
set noexpandtab

function! InsertIndent()
	if len(getline('.')) == 0
		return '"_cc'
	else
		return 'i'
	endif
endfunction

nnoremap <expr> i InsertIndent()

set wrap!
set linebreak
set textwidth=0
set wrapmargin=0
" }}}

" bell {{{
set vb
set t_vb=
" }}}

" syntax {{{
let c = 0

syntax on
filetype indent on

setlocal foldmethod=marker

set nohls

set t_Co=256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colo solarized
let g:solarized_termcolors=256

set bg=dark

nnoremap <Leader>p :so ~/.vim/autoload/palette.vim<CR>

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
" }}}

" search {{{
set is ic scs
" }}}

" function {{{
function! Swap(char)
	execute '%s/\(.*\)' . a:char . '\(.*\)/\2 - \1/'
endfunction
" }}}

" session {{{
let g:sessions_dir = '~/.vim/sessions'
" }}}

" vim-plug {{{
if empty(glob('~/.nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'kana/vim-textobj-user'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/matchit'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/l9'
Plug 'danro/rename.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'gioele/vim-autoswap'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'dhruvasagar/vim-table-mode'
Plug 'foosoft/vim-argwrap'
Plug 'mattn/webapi-vim'
Plug 'kshenoy/vim-signature'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'adriaanzon/vim-emmet-ultisnips' | Plug 'sirver/ultisnips'
Plug 'https://github.com/lervag/vimtex'

call plug#end()
" }}}

" Python {{{
let g:python_host_prog='/usr/bin/python'
" }}}

" NERDTree {{{
let sect = [
		\'/home/jack/Dropbox/note',
		\'/home/jack/Dropbox/ref'
		\]

autocmd VimEnter * if index(sect, getcwd()) == -1 && @% != '.git/COMMIT_EDITMSG' | NERDTree | wincmd w | endif

autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" ctrlp {{{
let g:ctrlp_working_path_mode='0'
let g:ctrlp_show_hidden=1
let g:ctrlp_user_command = [
		\'.git/',
		\'git --git-dir=%s/.git ls-files -oc --exclude-standard'
		\]
" }}}

" textobj-user {{{
call textobj#user#plugin('prop', {
\   'attr': {
\     'pattern': '\s\zs.*\ze:',
\     'select': ['cp'],
\   },
\ })

call textobj#user#plugin('val', {
\   'include-unit': {
\     'pattern': ':\s\zs.*\ze;',
\     'select': ['acv'],
\   },
\   'disclude-unit': {
\     'pattern': ':\s\zs.*\ze\(em\|ex\|%\|px\|cm\|mm\|in\|pt\|pc\|ch\|rem\|vh\|vw\|vmin\|vmax\|cm\|mm\|in\|px *\|pt\|pc\);',
\     'select': ['icv'],
\   },
\ })

call textobj#user#plugin('arg', {
\   'in': {
\     'pattern': '(*), ',
\     'select': ['ia'],
\   },
\   'around': {
\     'pattern': '*, ',
\     'select': ['aa'],
\   }
\ })
" }}}

" vim-table-mode {{{
let g:table_mode_corner='|'
" }}}

" vim-airline {{{
let g:airline_section_z = "%l/%L"

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" let g:airline_powerline_fonts=1

" if !exists('g:airline_symbols')
" 	let g:airline_symbols={}
" endif

"  " unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" }}}

" Emmet {{{
let g:user_emmet_install_global=0
autocmd FileType html EmmetInstall

let g:user_emmet_mode='a'
let g:user_emmet_expandabbr_key='<Tab>'
" }}}

" vim-signature {{{
abbr delm delm!<CR>:SignatureRefresh
" }}}

" vimtex {{{
let g:vimtex_fold_enabled=1
" }}}
