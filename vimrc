
" Plugins
filetype off

call plug#begin()

Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'othree/html5.vim'
Plug 'vimwiki/vimwiki' 
Plug 'mattn/calendar-vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'tmhedberg/SimpylFold'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'easymotion/vim-easymotion'
Plug 'kevinhui/vim-docker-tools'
Plug 'elzr/vim-json'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

filetype on
filetype plugin indent on
syntax on

" Let leader key be space key
let mapleader=" "

" fzf
map <leader>sf :Files<CR>
map <leader>st :Rg<CR>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)"

 " Make Ripgrep ONLY search file contents and not filenames
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
  \   <bang>0)


" Set invisible characters
nmap <leader>l :set list!<CR>
" Set chacters
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Turn on vim autocomplete
set omnifunc=syntaxcomplete#Complete

set nu "add line numbers
set mouse=a
set textwidth=80
set clipboard=unnamed
set tags=./tags;/

" relative number
" Show current line number
set number                     
" Show relative line num
set relativenumber             


" set autoindent spacing to use 2 single whitespaces
set shiftwidth=2
set tabstop=2
set expandtab

" Fix C++ indentation
setlocal autoindent
setlocal cindent
setlocal cinoptions=>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,gs,hs,ps,ts,is,+s,c3,C0,/0,(2s,us,U0,w0,W0,m0,j0,J0,)20,*70,#0

" nerd tree ignores
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" Enable folding
set foldmethod=indent
set foldlevel=99
" map folding to space
nnoremap <space> za
" simply fold, show doc string
let g:SimpylFold_docstring_preview=1

" Opening new edits for files in current working directory
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Python doc string
" doc string full
map <leader>dsf o"""Short docstring<ENTER><ENTER>Extended Docstring<ENTER><ENTER>Args:<ENTER>var1 (type): Input variable<ENTER><Enter><C-D>Returns:<ENTER>(type): Returned variable<ENTER><ENTER><C-D>"""<ESC>
" doc string short
map <leader>dss o""""""<ESC>hhi

" debug
imap tt<TAB> import ipdb;ipdb.set_trace()

" hello world print
map <leader>hw oprint("hello world")<ESC>

" html
au BufNewFile,BufRead *.ejs set filetype=html

:command! Skim execute ':silent! !open -ga skim %:r.pdf' | execute ':redraw!'

" Shortcuts for NERDTree, TagBar
map <leader>n :NERDTreeToggle<CR>
" Shortcuts for latex 
map <leader>la :Latexmk<CR>
map <leader>o :Skim<CR>

" let up and down movement be aware of screen wrap
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
xnoremap <expr> j v:count ? 'j' : 'gj'
xnoremap <expr> k v:count ? 'k' : 'gk'

" Quick navigation
"nnoremap J 5gj
"nnoremap K 5gk
"xnoremap J 5gj
"xnoremap K 5gk

" NO AUTO WRAP
set textwidth=0
set wrapmargin=0
:set linebreak

" Insert current date followed by day of the week
imap dd<TAB> <C-R>=strftime("%Y%m%d %A")<CR>

" Quickly resize vertical splits
nnoremap <leader>> <C-w>10>
xnoremap <leader>> <C-w>10>
nnoremap <leader>< <C-w>10<
xnoremap <leader>< <C-w>10<

" To quickly enter new buffer/return to previous buffer
nnoremap ff gf
xnoremap ff gf
nnoremap fd :bprevious<CR>
xnoremap fd :bprevious<CR>


" Remaps for folding
nnoremap zz za
xnoremap zz za
nnoremap zo zr
xnoremap zo zr
nnoremap zc zm
xnoremap zc zm

" Show time in status bar
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" Set search ignore options
set wildignore+=*.o,*.fig,*.avi,*.mat,*.default,*.log,*.d,*.aux,*.toc,*.pdf,*.fls,*.fdb_latexmk,*.blg,*.bbl,*.bib,*.png,*.tiff,*.jpg,*.pkl,*.p,*.pickle,*cpkl,*h5,*pyc,*pth

" Spelling
" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

" Set region to British English
set spelllang=en_us


if has("autocmd")
  " Get rid of auto-comment new lines
  autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o

  autocmd bufenter * if (winnr("$") == 1 && exists("B:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  " Turn off wrap text for markdown
  au BufNewFile,BufRead *md setl tw=88 fo+=a fo+=t

  " Turn off wrap text for html
  autocmd FileType html setlocal tw=0 formatoptions

  " Set up python
  au FileType python:
      \ setlocal tabstop=4
      \ setlocal softtabstop=4
      \ setlocal shiftwidth=4
      \ setlocal textwidth=88
      \ setlocal expandtab
      \ setlocal autoindent
      \ setlocal fileformat=unix
      \ setlocal encoding=utf-8

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Turn on spell check if .txt, tex, md
  autocmd BufNewFile,BufRead *.txt setlocal spell
  autocmd BufNewFile,BufRead *.md setlocal spell
  autocmd BufNewFile,BufRead *.tex setlocal spell

  " Turn on wrap text if .tex
  au BufRead,BufNewFile *.tex setlocal textwidth=80
  autocmd FileType tex setlocal tw=80

  " Strip trailing white spaces
  autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()
endif

" line ending
:set fileformat=unix

" vimwiki - Personal Wiki for Vim
" https://github.com/vimwiki/vimwiki
set nocompatible
filetype plugin on
syntax on
" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax

" Calendar
map <leader>c :Calendar<CR>

" vim wiki preferences
let vim_wiki = {}
let vim_wiki.path = '~/Documents/Notes/vim_wiki/'
let vim_wiki.syntax = 'markdown'
let vim_wiki.ext = '.md'
let g:instant_markdown_autostart = 0 
map <leader>md :InstantMarkdownPreview<CR>

" Make a list of vim wikis so you can have multiples [wiki1, wiki2,..]
let g:vimwiki_list = [vim_wiki]
map <leader>wl <leader>ww<CR>:VimwikiAll2HTML<CR><leader>whh<CR><leader>ww<CR>

" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0 " sisable autostart
map <leader>md :InstantMarkdownPreview<CR>
map <leader>mdd :!open -a macdown %<CR>

" Strip trailing white spaces
nnoremap <silent> <leader>sws :call <SID>StripTrailingWhitespaces()<CR>

" Functions
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePost *.py call flake8#Flake8()
