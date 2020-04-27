" vim: set sw=4 ts=4 sts=4 et tw=80 foldmarker={,} foldlevel=0 foldmethod=marker nospell:
"             _                              __ _
"  _ ____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
" | '_ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
" | | | \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
" |_| |_|\_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                 |___/

" author: @latavin243

" basic settings {
let mapleader=' '

syntax enable
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set foldenable
set hidden
set mouse=a
set nocompatible
set showcmd
set title
set ttyfast  " scroll faster
set lazyredraw " scroll faster

set inccommand=split
" }

" indentation {
set autoindent
set expandtab
set smartindent

set shiftwidth=4
set softtabstop=4
set tabstop=4
" }

" appearance {
set number
set relativenumber
set textwidth=120
set nowrap
set scrolloff=5
set sidescrolloff=10
set laststatus=2
" }

" search {
set hlsearch
set ignorecase
set incsearch
set smartcase

" match bracket
set showmatch
set matchtime=2
" }

" editing {
set nospell
set nobackup
set noswapfile
set noundofile

set backupdir=$HOME/.vim/.backup//
set directory=$HOME/.vim/.swp//
set undodir=$HOME/.vim/.undo//

set noerrorbells
set history=1000
set autoread  " auto read if file is modified in other place

set wildmenu
set wildmode=longest,list,full
" }

" key mappings {
noremap s <nop>

" buffer jump
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" split window jump
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" disable some mappings
map <c-b> <nop>
map <c-f> <nop>
map <c-q> <nop>

" select autocomplete suggestions
inoremap <c-j> <down>
inoremap <c-k> <up>

" copy
nnoremap Y y$
vnoremap Y "+y

" indentation
nnoremap > >>
nnoremap < <<

" no hlsearch
nnoremap <leader><cr> :noh

" open terminal below
noremap <leader>/ :set splitbelow<CR>:sp<CR>:term<CR>

" customize placeholder <XD>
nnoremap <leader><c-t> <esc>a<XD><esc>
nnoremap <c-t> h/<XD><cr>:nohl<cr>"_c4l
inoremap <c-t> <esc>/<XD><cr>:nohl<cr>"_c4l

" todo placeholder `TODO`
nnoremap <leader>to /TODO<cr>:nohl<cr>v$h

" spell check
nnoremap <leader>sc :set spell!<CR>

" auto complete
inoremap <C-x>s <Esc>ea<C-x>s
" }

" command mode and insert mode emacs-style {
cnoremap <c-b> <left>
cnoremap <c-f> <right>
cnoremap <c-n> <down>
cnoremap <c-p> <up>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-d> <del>
cnoremap <m-b> <s-left>
cnoremap <m-f> <s-right>

inoremap <c-b> <left>
inoremap <c-f> <right>
inoremap <c-n> <down>
inoremap <c-p> <up>
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>

" rotate windows
noremap srh <c-w>b<c-w>K
noremap srv <c-w>b<c-w>H

" close window below
noremap <leader>q <c-w>j:q<cr>
" }

" tab {
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>
" }

" get next pattern in visual mode {
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
" }

" coding {
" autoformat
autocmd BufEnter *.py :set ft=python
autocmd bufwrite *.{py,go} :Autoformat

" yaml
autocmd! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd! FileType yaml set ts=2 sts=2 sw=2 nosi noai

" python
let python_highlight_all=1
autocmd Filetype python set fileformat=unix
autocmd Filetype python set foldlevel=99
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set textwidth=120
autocmd FileType python set colorcolumn=120
let g:pymode_options_max_line_length=120
" }

" short for command {
" open vimrc
nnoremap <leader>rc :e ~/.config/nvim/init.vim<cr>

" ascii art
nnoremap tx :r!figlet<space>
" }

" source plugin file {
source $HOME/.config/nvim/plugins.vim
" }

" theme {
colorscheme PaperColor
set background=dark
" transparent
hi Normal ctermbg=None
" }

" use local vimrc if available {
if filereadable(expand("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif
" }
