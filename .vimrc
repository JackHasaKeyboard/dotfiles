" dir {{{
autocmd VimEnter * wincmd p
" }}}

" file {{{
set wildignore=*.swp,*.lock,*.gz,*.DS_Store,*.keep
set wildignore+=**/tmp/**,/vendor/**

set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
" }}}

" buffer {{{
set undofile
set undolevels=1000
set undoreload=10000

set lazyredraw

au VimResized * exe "normal! \<C-W>="
" autocmd BufWritePre *.haml, *.js, *.scss :silent !chrome window.location.reload()

" todo source vimrc
augroup vimrc
	autocmd! BufWritePost .vimrc source % | echom "Reloaded " . .vimrc | redraw
augroup END
" }}}

" syntax {{{
syntax on
filetype indent on

let &t_Co=256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set hls!
" set NoMatchParen

setlocal foldmethod=expr

" line {{{
set nu

set ts=2 sw=2
set softtabstop=0
set smartindent
set noexpandtab
" }}}

" search {{{
set is ic scs
" }}}

" remap {{{
" leader {{{
let mapleader=","

nnoremap <Leader>h :bprev<CR>
nnoremap <Leader>l :bnext<CR>

nnoremap <Leader>b 2o<Esc>i
nnoremap <Leader>B O<Esc>O<Esc>i
nnoremap <Leader>u o<Esc>O<Esc>i
nnoremap <Leader>U O<Esc>o<Esc>i
nnoremap <Leader>U O<Esc>o<Esc>i

nnoremap <Leader>j :join
" }}}

nnoremap <Leader>= K=J''

nnoremap <Leader>w :set wrap!

noremap r <C-r>

noremap ; :

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
nnoremap <c-o> <c-o>zz

nnoremap vv ^vg_
nnoremap gV `[V`]

nnoremap <C-c> "+y

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

noremap <silent> <C-F> :NERDTreeToggle<CR>

cnoreabbr nt NERDTree
cnoreabbr rc e ~/.vimrc
cnoreabbr td sp ~/Dropbox/note/todo.txt
" }}}

" macro {{{
" }}}

" let g:indentguides_state = 0
" function! IndentGuides()
" 	if g:indentguides_state
" 		let g:indentguides_state = 0
" 		2match None
" 	else
" 		let g:indentguides_state = 1
" 		execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
" 	endif
" endfunction
" hi def IndentGuides guibg=#303030 ctermbg=234
" nnoremap <leader>I :call IndentGuides()<cr>
" }}}

" you-complete-me {{{
let g:python_host_prog='/usr/bin/python'
" }}}

" emmet {{{
let g:user_emmet_expandabbr_key='<Tab>'
" }}}

" augroup line_return
" au!
" au BufReadPost *
" \ if line("'\"") > 0 && line("'\"") <= line("$") |
" \			execute 'normal! g`"zvzz' |
" \ endif
" augroup END

" autocmd BufWritePre * :normal K=J
" autocmd BufWritePre * set noet|retab!
" autocmd BufWritePre * %s/\s\+$//

" vim-plug {{{
if empty(glob('~/.nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'flazz/vim-colorschemes'
Plug 'skammer/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/matchit'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'xolox/vim-session'
Plug 'mattn/emmet-vim'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/L9'
Plug 'danro/rename.vim'
" Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-haml'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'gioele/vim-autoswap'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jceb/vim-orgmode'
Plug 'dhruvasagar/vim-table-mode'

call plug#end()
" }}}

" vim-colorschemes {{{
colo solarized
let g:solarized_termcolors=256
set bg=light
" }}}

" nerdtree {{{
autocmd VimEnter * NERDTree
execute "normal \<C-w>\<C-w>"
autocmd VimEnter * wincmd w

let NERDTreeShowHidden=1
" }}}

" ctrl-p {{{
let g:ctrlp_working_path_mode='0'
" }}}

" emmet {{{
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" }}}

" vim-table-mode {{{
let g:table_mode_corner="|"
" }}}

" tmux {{{
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

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
" }}}

" session {{{
let g:session_autoload = 'no'
let g:session_autosave = 'no'
" }}}
