" vim: set sw=4 ts=4 sts=4 et tw=80 nospell:
"             _                              __ _
"  _ ____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
" | '_ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
" | | | \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
" |_| |_|\_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                 |___/

" author: @latavin243

" basic settings {{{
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
set diffopt+=vertical " split vertically
" }}}

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
" set relativenumber
set textwidth=120
set nowrap
set scrolloff=4
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
" noremap s <nop>
nnoremap Q :q<cr>

" buffer
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
" map <c-b> <nop>
" map <c-f> <nop>
map <c-q> <nop>

" select autocomplete suggestions
" inoremap <c-j> <down>
" inoremap <c-k> <up>

" copy
nnoremap Y y$
vnoremap Y "+y

" indentation
nnoremap > >>
nnoremap < <<

" no hlsearch
nnoremap <leader><cr> :noh

" line wrap
nnoremap <leader>wp :set wrap<cr>

" open terminal below
noremap <leader>/ :set splitbelow<CR>:sp<CR>:term<CR>

" customize placeholder _XD_
" nnoremap <leader><c-t> a_XD_<esc>
nnoremap <leader><c-t> b/_XD_<cr>:nohl<cr>"_c4l
inoremap <c-t> <esc>/_XD_<cr>:nohl<cr>"_c4l

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
inoremap <c-k> <esc>lC

" rotate windows
" noremap srh <c-w>b<c-w>K
" noremap srv <c-w>b<c-w>H

" close window below
noremap <leader>q <c-w>j:q<cr>
" }

" tab {
" Create a new tab with tu
nnoremap tu :tabe<CR>
nnoremap tn :tabnew<cr>
" Move the tabs with tn and ti
nnoremap t+ :tabmove +<CR>
nnoremap t- :tabmove -<CR>
" }

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
" }

" coding {

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
autocmd BufEnter *.py :set ft=python
autocmd bufwrite *.py :Autoformat
let g:pymode_options_max_line_length=120
" }

" short for command {
" open vimrc
nnoremap <leader>rc :e ~/.config/nvim/init.vim<cr>

" ascii art
nnoremap tx :r!figlet<space>
" }

" plugins {
call plug#begin('~/.config/nvim/plugins')

" ===
" === basic
" ===
Plug 'bling/vim-bufferline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'Yggdroot/indentLine'
Plug 'chiel92/vim-autoformat'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-expand-region'

" buffer only
Plug 'latavin243/BufOnly.vim'
" show mark
" Plug 'kshenoy/vim-signature'

" reg list
Plug 'junegunn/vim-peekaboo'

" easymotion {
Plug 'easymotion/vim-easymotion'
nmap ff <plug>(easymotion-jumptoanywhere)
nmap ss <plug>(easymotion-s2)
nmap sn <plug>(easymotion-sn)
let g:EasyMotion_smartcase=1
let g:EasyMotion_keys = 'fjdkswbeoavn'
" }

" guentags {
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_project_root = ['.git','.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.config/nvim/cache/gutentags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
" }

" ale: linting {
Plug 'w0rp/ale'
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
" }

" ===
" === editing
" ===
" nerdcommentor {
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDCommentEmptyLines=1
let g:NERDDefaultAlign='left'
" }

" illuminate {
Plug 'RRethy/vim-illuminate' " highlight word under cursor
" }

" auto-pair brackets and quotes {
Plug 'jiangmiao/auto-pairs'
" }

" ===
" === filer
" ===
" startify {
Plug 'mhinz/vim-startify'
let g:startify_change_to_dir=0
let g:startify_change_to_vcs_root=1
autocmd filetype startify set cursorline
" }

" ===
" === search
" ===
" leaderf {
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
let g:Lf_ReverseOrder = 1
let g:Lf_Ctags = "ctags"
let g:Lf_ShowDevIcons = 0
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
nnoremap <leader>ll :Leaderf<space>
nnoremap <leader>p :LeaderfFile<cr>
nnoremap <leader>lb :LeaderfBuffer<cr>
nnoremap <leader>lf :LeaderfFunction<cr>
nnoremap <leader>sf :Leaderf<space>rg<cr>
nnoremap <leader>rg :Leaderf<space>rg<cr>
" }

" ===
" === format
" ===
" tabular {
Plug 'godlygeek/tabular'
" }

" ===
" === markdown
" ===

" markdown-preview {
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown'] }
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
" }

" table-mode {
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle', 'for': ['markdown', 'text']}
nnoremap <leader>tm :TableModeToggle
" }

" vim-easy-align {
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }

" ===
" === entertainment
" ===
" comfortable-motion {
"Plug 'yuttie/comfortable-motion.vim'
"let g:comfortable_motion_scroll_down_key = "j"
"let g:comfortable_motion_scroll_up_key = "k"
" }

" ===
" === autocomplete
" ===
" coc {
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
    \'coc-explorer',
    \'coc-gitignore',
    \'coc-json',
    \'coc-lists',
    \'coc-python',
    \'coc-vimlsp',
    \'coc-yank',
\]

" Trigger completion.
inoremap <silent><expr> <c-q> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <c-e> :CocCommand explorer<cr>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" }

" untisnips & vim-snippets {
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-o>"
let g:UltiSnipsJumpBackwardTrigger="<c-o><c-o>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/ultisnips/', 'ultisnips']
" }

" ===
" === language
" ===
" vim-go {
Plug 'fatih/vim-go' , { 'for': [ 'go', 'vim', 'vim-plug' ], 'tag': '*' }
" Plug 'fatih/vim-go' , { 'for': 'go', 'tag': '*', 'do': ':GoUpdateBinaries' }
let g:go_version_warning = 0
" highlights
let g:go_highlight_functions = 1
let g:go_highlight_function_calls  =  1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = -1
let g:go_highlight_types  =  1
let g:go_highlight_fields  =  1
let g:go_highlight_extra_types = 1

let g:go_decls_includes = "func"
let g:go_decls_includes = "func,type"

let g:go_def_mode = 'godef'
let g:go_info_mode = 'gocode'
let g:go_fmt_command = "gofmt"
let g:go_fmt_experimental = 1

" linter
" let g:go_metalinter_autosave = 0

nnoremap <leader>n :cnext<cr>
nnoremap <leader>m :cprevious<cr>
nnoremap <leader>gdb :GoDocBrowser<cr>

nnoremap gi :GoImplement<cr>
autocmd bufenter *.go :set ft=go
" autocmd filetype go set foldmethod=syntax foldnestmax=1
autocmd! bufwrite *.go :Autoformat
" autocmd bufwritepost *.go :normal! zv
" }

" python-mode {
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" }

" gitignore {
Plug 'gisphm/vim-gitignore'
" }

" ===
" === theme
" ===
Plug 'NLKNguyen/papercolor-theme'
" Plug 'vim-scripts/peaksea'

" airline {
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_section_b='' " vcs info
let g:airline_section_c='' " filename
let g:airline_section_y='' " file encoding
" }

" rainbow {
Plug 'luochen1990/rainbow'
let g:rainbow_active=1
" }

call plug#end()
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

" run vim run {
noremap <leader>rr :call RunVimRun()<CR>
func! RunVimRun()
	exec "w"
	if &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	endif
endfunc

noremap <leader>rt :call RunVimTest()<cr>
func! RunVimTest()
    exec "w"
	if &filetype == 'sh'
		:!time bash %
    elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go test %
	endif
endfunc
" }

" clear history
func! CleanHistory()
    :g/;ls$/d
    :g/;cd$/d
    :g/;exit$/d
    :g/;clear$/d

    " vim
    :g/;vim$/d
    :g/;vimzsh$/d
    :g/;vimvim$/d
    :g/;vimplugrefresh$/d
    :g/;fg$/d

    " git
    :g/;gb$/d
    :g/;gst$/d
    :g/;gd$/d
    :g/;gcof$/d
    :g/;gup$/d
endfunc

func! TomlToJSON()
    :set ft=json
    :g/^$/d
    :v/\[/norm f=r:A,
    :v/\[/norm ^crscsw"
    :%s/^\[\(\w*\)\]/\r\1.json/
    :g/\[/norm f#D
    :%s/\s*\[\(.*\)\]/"\1"/
endfunc

func! AddJsonTag()
    :norm ^yiw$a `json:"markviwpcrs
endfunc

func! DeleteRepeatRow()
    :g/^\(.*\)$\n\1$/d
endfunc

nnoremap <leader>d :set splitbelow<cr>:sp<cr>:term curl https://d.supjohn.com/<c-r><c-w><cr><esc>

func! AddSplitLine()
    :t. | norm Vr=
endfunc
