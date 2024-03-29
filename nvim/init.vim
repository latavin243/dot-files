" vim: set sw=4 ts=4 sts=4 et tw=80 nospell:
"             _                              __ _
"  _ ____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
" | '_ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
" | | | \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
" |_| |_|\_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                 |___/

" author: @latavin243

" basic settings
lua require('core')

" source nvim config
nnoremap <leader>so :source $MYVIMRC<cr>

syntax enable
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
lang en_US.UTF-8
set nocompatible

set diffopt+=vertical " split vertically

" editing {
set backupdir=$HOME/.vim/.backup//
set directory=$HOME/.vim/.swp//
set undodir=$HOME/.vim/.undo//

set wildmode=longest,list,full
" }

" key mappings {
nnoremap s <nop>
map Q <nop>
nnoremap <esc> :noh<cr>

" buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" quick scroll
nnoremap <c-e> 2<c-e>
nnoremap <c-y> 2<c-y>

" quick ft
nnoremap <leader>ft :set ft=

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

" search selected text
vnoremap / y/\V<C-R>=escape(@",'/\')<CR><CR>

" indentation
" nnoremap > >>
" nnoremap < <<

" no hlsearch
nnoremap <leader><cr> :noh

" line wrap
nnoremap <leader>wp :set wrap<cr>

" open terminal below
noremap <leader>/ :set splitbelow<CR>:sp<CR>:term<CR>

" customize placeholder _TODO_
" nnoremap <leader><c-t> a_TODO_<esc>
nnoremap <leader><c-t> b/_TODO_<cr>:nohl<cr>"_c6l
nnoremap <leader>tt b/_TODO_<cr>:nohl<cr>"_c6l
inoremap <c-t> <esc>/_TODO_<cr>:nohl<cr>"_c6l

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
" inoremap <c-n> <down>
" inoremap <c-p> <up>
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
autocmd! FileType yaml set ts=2 sts=2 sw=2 nosi noai expandtab

" mermaid
autocmd! BufNewFile,BufReadPost *.{mmd} set filetype=mermaid
autocmd! FileType mermaid set ts=2 sts=2 sw=2 nosi noai expandtab

" json
autocmd! FileType json set ts=2 sts=2 sw=2 nosi noai expandtab
autocmd! FileType dot set ts=2 sts=2 sw=2 nosi noai expandtab

" python {
let python_highlight_all=1
autocmd Filetype python set fileformat=unix
autocmd Filetype python set foldlevel=99
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set textwidth=120
autocmd FileType python set colorcolumn=120
autocmd BufEnter *.py :set ft=python
" autocmd bufwrite *.py :Autoformat
" }

" csv {
autocmd! InsertLeave *.csv :%Tabularize /,
" }

" short for command {
" open vimrc
nnoremap <leader>rc :e $HOME/.config/nvim/init.vim<cr>

" ascii art
nnoremap tx :r!figlet<space>
" }

" plugins {
call plug#begin('$HOME/.config/nvim/plugins')

" ===
" === basic
" ===
Plug 'bling/vim-bufferline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'Yggdroot/indentLine'
Plug 'chiel92/vim-autoformat'
Plug 'terryma/vim-expand-region'

Plug 'calebsmith/vim-lambdify'

" repeat f and t (needs vim-repeat)
Plug 'dahu/vim-fanfingtastic'

" narrow region {
" Plug 'chrisbra/nrrwrgn'
" let g:nrrw_rgn_vert = 1
" let g:nrrw_rgn_wdth = 120
" let g:nrrw_topbot_leftright = 'botright'
" }

" inline-edit, narrow region
Plug 'andrewradev/inline_edit.vim'
let g:inline_edit_autowrite = 1
" let g:inline_edit_new_buffer_command = 'rightbelow vertical new'
let g:inline_edit_new_buffer_command = "call CreateCenteredFloatingWindow(0.8, 0.8)"
vnoremap <leader>nr :InlineEdit<cr>

" vis & visincr
Plug 'vim-scripts/vis'
" :B, :S
Plug 'vim-scripts/VisIncr'
" :I, :I -1, :II, etc

" rst-tables
Plug 'Stormherz/tablify'

" cycle, e.g. true <-> false
Plug 'bootleq/vim-cycle'
nmap <silent> <leader>jj <Plug>CycleNext
nmap <silent> <leader>kk <Plug>CyclePrev
vmap <silent> <leader>jj <Plug>CycleNext
vmap <silent> <leader>kk <Plug>CyclePrev
noremap <silent> <Plug>CycleFallbackNext <C-A>
noremap <silent> <Plug>CycleFallbackPrev <C-X>

" cheat sheet
Plug 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = [ 'jshint' ]
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_shell_checkers = ['shellcheck']
Plug 'dbeniamine/cheat.sh-vim'

" custom {
" buffer only
Plug 'latavin243/BufOnly.vim'
Plug 'latavin243/searchit.vim'
nnoremap <leader>sg :Searchit google<space>
" nnoremap <leader>sso :Searchit stackoverflow<space>
nnoremap <leader>st :Searchit<space>
nnoremap <leader>sgo :Searchit go <c-r><c-w><cr>

Plug 'latavin243/vim-centered-float-window', {'branch': 'main'}

Plug 'latavin243/ts2dt.vim', {'branch': 'main'}
nnoremap <leader>ts :TS2DT <c-r><c-w>
" }

" " telescope
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" ranger {
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
nnoremap <leader>ra :RangerWorkingDirectoryNewTab<CR>
let g:ranger_map_keys = 0
" }

" tmux {
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
" }

" show mark
" Plug 'kshenoy/vim-signature'

" register list
Plug 'tversteeg/registers.nvim', {'branch': 'main'}

" easymotion {
Plug 'easymotion/vim-easymotion'
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable
let g:EasyMotion_smartcase=1
" let g:EasyMotion_keys = 'fjdkslurwbeoavn'
let g:EasyMotion_keys = 'asdfghjklqwertyuiop'

" jump by n chars
nmap <leader>jl <plug>(easymotion-overwin-line)
nmap <leader>jn <plug>(easymotion-overwin-sn)
" nmap <leader>ss <plug>(easymotion-s2)
" nmap <leader>ss <plug>(easymotion-overwin-sn)
" nmap <leader>sn <plug>(easymotion-overwin-sn)
" nmap <leader>ss <plug>(easymotion-sn)

" jump word
nmap <leader>jw <Plug>(easymotion-overwin-w)
nnoremap ss <plug>(easymotion-overwin-w)
" }

" guentags {
" Plug 'ludovicchabant/vim-gutentags'
" let g:gutentags_project_root = ['.git','.project']
" let g:gutentags_ctags_tagfile = '.tags'
" let s:vim_tags = expand('$HOME/.config/nvim/cache/gutentags')
" let g:gutentags_cache_dir = s:vim_tags
" if !isdirectory(s:vim_tags)
"     silent! call mkdir(s:vim_tags, 'p')
" endif
" let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
" }

" git
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'
command! Gblame :Git blame
command! Gco :GBranches
command! Gst :G
" command! Gc :Gcommit
command! Gp :Git push
nnoremap <leader>gco :GBranches<cr>
nnoremap <leader>gst :G<cr>
" refer to http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/
nnoremap <leader>gl :diffget //2<cr>
nnoremap <leader>gr :diffget //3<cr>

Plug 'airblade/vim-gitgutter'

" ale: linting {
Plug 'w0rp/ale'
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
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
let g:NERDCreateDefaultMappings = 0
nmap <leader>cc <plug>NERDCommenterToggle
xmap <leader>cc <plug>NERDCommenterToggle
" }

" graphviz {
Plug 'liuchengxu/graphviz.vim'
let g:graphviz_output_format = 'png'
" }

" illuminate {
Plug 'RRethy/vim-illuminate' " highlight word under cursor
" }

" auto-pair brackets and quotes {
Plug 'jiangmiao/auto-pairs'
" }

" multi-cursor {
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<leader>mc' " replace C-n
let g:VM_maps['Find Subword Under'] = '<leader>mc' " replace visual C-n
let g:VM_maps["Select Cursor Down"] = '<M-C-j>'    " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<M-C-k>'    " start selecting up
" }

" org-mode
Plug 'jceb/vim-orgmode'
let g:org_export_emacs="/usr/local/bin/emacs"
" Plug 'aloussase/OrgEval.vim'

" hardtime, disabling repeating hjkl motions
Plug 'takac/vim-hardtime'
let g:hardtime_default_on = 0

" ===
" === filer
" ===
" startify {
Plug 'mhinz/vim-startify'
let g:startify_change_to_dir=0
let g:startify_change_to_vcs_root=1
let g:startify_session_dir='$HOME/.vim/sessions'
let g:startify_files_number=20
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
let g:Lf_UseVersionControlTool = 0
let g:Lf_UseMemoryCache = 0
nnoremap <leader>ll :Leaderf<space>
" nnoremap <leader>ff :LeaderfFile<cr>
nnoremap <leader>ff :FZF<cr>
nnoremap <leader>bb :LeaderfBuffer<cr>
nnoremap <leader>sf :Leaderf<space>rg<cr>
nnoremap <leader>rg :Leaderf<space>rg<cr>
let g:Lf_CommandMap = {
\   '<C-k>': ['<C-p>'],
\   '<C-p>': ['<C-k>'],
\   '<C-j>': ['<C-n>'],
\}
nmap <leader>wg <plug>LeaderfRgCwordLiteralBoundary<cr>
vmap <leader>wg <plug>LeaderfRgCwordLiteralBoundary<cr>
" }

" ===
" === format
" ===
" tabular {
Plug 'godlygeek/tabular'

Plug 'vim-scripts/swapcol.vim'
" }

" ===
" === markdown
" ===

" markdown
" depends on godlygeek/tabular
" Plug 'plasticboy/vim-markdown'

" markdown-preview {
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for' :['markdown'] }
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
" === syntax parser
" ===

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" ===
" === autocomplete
" ===
" coc {
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
    \'coc-actions',
    \'coc-diagnostic',
    \'coc-explorer',
    \'coc-floaterm',
    \'coc-json',
    \'coc-lists',
    \'coc-prettier',
    \'coc-pyright',
    \'coc-smartf',
    \'coc-snippets',
    \'coc-vimlsp',
    \'coc-yaml',
    \'coc-sh',
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
nmap <silent> <c-]> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<cr>
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>ee :CocCommand explorer<cr>
" nnoremap <c-c> :CocCommand<CR>

nnoremap <c-w><c-p> <Plug>(coc-float-jump)

function! s:check_backspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_backspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>fc <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver
" nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" coc-smartf
" nmap f <Plug>(coc-smartf-forward)
" nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

" }

" coc-fzf
Plug 'junegunn/fzf', {'dir': '$HOME/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
nnoremap <silent> <leader>xx :<c-u>CocFzfList<cr>
" nnoremap <silent> <leader>lf :<c-u>CocFzfList outline<cr>
nnoremap <leader>lf :LeaderfFunction<cr>
nnoremap <silent> <leader>df :<c-u>CocFzfList diagnostics<cr>
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 } }
let $FZF_DEFAULT_OPTS="--reverse"
nnoremap // :BLines<cr>
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

" float term
Plug 'voldikss/vim-floaterm'
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>

" untisnips & vim-snippets {
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-o>"
let g:UltiSnipsJumpBackwardTrigger="<c-o><c-o>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/ultisnips/', 'ultisnips']
" }

" spell check (camelcase spell check)
Plug 'kamykn/spelunker.vim'
Plug 'kamykn/popup-menu.nvim'

" ===
" === language
" ===
" vim-go {
Plug 'fatih/vim-go' , { 'for': [ 'go', 'vim', 'vim-plug' ], 'branch': 'master' }
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
let g:go_highlight_string_spellcheck = 1

let g:go_decls_includes = "func"
let g:go_decls_includes = "func,type"

" let g:go_def_mode = 'godef'
" let g:go_info_mode = 'gocode'
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
" use gofumpt
let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1
let g:go_fmt_experimental = 1

" " conflict with coc-go
" let g:go_code_completion_enabled = 0

" linter
let g:go_metalinter_enabled = [
    \'deadcode',
    \'errcheck',
    \'gosimple',
    \'vet',
    \'golint',
    \'staticcheck',
    \'typecheck',
    \'unused',
    \'varcheck',
\]
let g:go_metalinter_command = "golangci-lint run %"
let g:go_metalinter_deadline = "5s"
" let g:go_metalinter_autosave = 1

nnoremap <leader>n :cnext<cr>
nnoremap <leader>m :cprevious<cr>

autocmd bufenter *.go :set ft=go
autocmd filetype go call SetGolangOptions()
function SetGolangOptions()
    nnoremap <leader>gdb :GoDocBrowser<cr>
    nnoremap gi :GoImplement<cr>
    nnoremap <c-]> :GoDef<cr>

    command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    command! -bang AS call go#alternate#Switch(<bang>0, 'split')
endfunction

" autocmd filetype go set foldmethod=syntax foldnestmax=1
autocmd filetype go set foldmethod=indent foldnestmax=1
autocmd filetype godoc set nofoldenable
" autocmd! bufwrite *.go :Autoformat
autocmd! bufwrite *.go :GoImports
" autocmd bufwritepost *.go :normal! zv
" }

" gotest-vim
Plug 'buoto/gotests-vim'
" let g:gotests_template_dir = '/Users/qiguo/workspace/gotests_template/templates/'

" === scala
Plug 'nvim-lua/plenary.nvim'
Plug 'scalameta/nvim-metals', { 'branch': 'main' }

" python-mode {
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
let g:pymode_options_max_line_length=120
" }

" document dash
Plug 'rizzatti/dash.vim'

" ===
" === theme
" ===
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'vim-scripts/peaksea'
Plug 'srcery-colors/srcery-vim'
" Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark='hard'

" Plug 'nanotech/jellybeans.vim'


" lightline {
Plug 'itchyny/lightline.vim'
" }

" " icons lspkind-nvim
" Plug 'lspkind-nvim'

" rainbow {
Plug 'luochen1990/rainbow'
let g:rainbow_active=1
" }

" date calculation {
Plug 'tpope/vim-speeddating'

command! AddDTFormat call AddDTFormatFunc()
func! AddDTFormatFunc()
    :SpeedDatingFormat %Y%m%d
endfunc
" }

" wildfire, expand region
Plug 'gcmt/wildfire.vim'
let g:wildfire_objects = ["iw", "i'", 'i"', "i)", "i]", "i}", "ip", "it"]

" " accelerate cursor move
" Plug 'rhysd/accelerated-jk'
" nmap j <Plug>(accelerated_jk_gj)
" nmap k <Plug>(accelerated_jk_gk)

" copilot
Plug 'github/copilot.vim', {'branch': 'release'}
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

call plug#end()
" }

" syntax parser config
" nvim-treesitter (must after plug#end)
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"java", "gomod", "toml", "yaml", "json"},     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust", "go", "python" },  -- list of language that will be disabled
  },
}
EOF

" theme {
" colorscheme PaperColor
" colorscheme srcery
color gruvbox
set t_Co=256
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
    :w
    if &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'go'
        :GoRun
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'xhtml'
        :!open % -a Google\ Chrome
    elseif &filetype == 'dot'
        let current_file_name=expand('%:r')
        let output_file_path=current_file_name . '.png'
        exec "!dot -Tpng % -o " . output_file_path
        exec "!open " . output_file_path
    elseif &filetype == 'mermaid'
        " let current_file_name=expand('%:r')
        " let output_file_path=current_file_name . '.png'
        " exec "!mmdc -H -i " . current_file_name . ".mmd -o " output_file_path . " -t bright -b transparent"
        " exec "!open " . output_file_path
        exec "!mermaid %"
    elseif &filetype == 'scala'
        set splitbelow
        :sp
        :term scala %
    endif
endfunc

noremap <leader>rt :call RunVimTest()<cr>
func! RunVimTest()
    :w
    if &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'go'
        " :GoTest
        set splitbelow
        :sp
        :term go test -v %
    endif
endfunc

noremap <leader>rl :call RunVimLint()<cr>
func! RunVimLint()
    :w
    if &filetype == 'go'
        :GoMetaLinter
    endif
endfunc
" }

" clear history
command! CleanHistory call CleanHistoryFunc()
func! CleanHistoryFunc()
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
    :g/;grba$/d
    :g/;grbc$/d

    " delete repeat history
    :g/^: \d\{10\}:\d;\(.*\)$\n: \d\{10\}:\d;\1$/d
    :g/^: \d\{10\}:\d;\(.*\)$\n.*\n: \d\{10\}:\d;\1$/d
    :g/^: \S*;\(.*\)$\n^: \S*;\1$/d
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

command! DeleteRepeatRow call DeleteRepeatRowFunc()
func! DeleteRepeatRowFunc()
    :g/^\(.*\)$\n\1$/d
endfunc

" nnoremap <leader>d :set splitbelow<cr>:sp<cr>:term curl https://d.supjohn.com/<c-r><c-w><cr><esc>
nnoremap <leader>d :set splitbelow<cr>:sp<cr>:term fanyi <c-r><c-w>

func! AddSplitLine()
    :t. | norm Vr=
endfunc

command! -nargs=+ WrapBy execute '.substitute/' . split(<q-args>,' ')[0] . '/&\r/g'

func! AddEnum(n)
    :for i in range(1,a:n) | put =i | endfor
endfunc

command! ToGoJSONField call ToGoJSONFieldFunc()
" func! ToGoJSONFieldFunc()
"     :norm elD
"     :s/\s*//g
"     :s/\(.*\)/\1 _TODO_ `json:"\1"`/
"     :norm 0
"     :norm crc
"     :norm gUl
"     :nohl
" endfunc
func! ToGoJSONFieldFunc()
    :s/^\s*\(\w*\)\s*.*$/\1 _TODO_ `json:"\1"`/
    :norm crm
    :nohl
endfunc

command! SelectFuncion call SelectFunctionFunc()
func! SelectFunctionFunc()
    :norm [[V][
endfunc

command! DeleteTailingSpaces :s/\s*$//
command! DeleteTailingSpacesAll :%s/\s*$//

command! CleanupSqlCreation call CleanupSqlCreationFunc()
func! CleanupSqlCreationFunc()
    :%s/^|.*| \(.*\)\s*|$/\1/
    :%s/\s*$//
    :g/----/d
    :g/Create Table/d
endfunc

command! -range AddGoJSONTagWithFirst call AddGoJSONTagWithFirstFunc()
func! AddGoJSONTagWithFirstFunc() range
    :s/\s*\(\w*\)\s*\(.*\)/\1 \2 `json:"\1"`/
endfunc

command! CountLineRepeat call CountLineRepeatFunc()
func! CountLineRepeatFunc()
    :%!sort | uniq -c | sort
endfunc

" peek definition
" Experimental feature (peek definition): gp
" Peek into the definition in a floating window.
" TODO: If there are 2+ definitions, it does not work with floating windows (coc.nvim problem)
" command! -nargs=0 PreviewDefinition :call CocActionAsync('jumpDefinition', 'call CreateCenteredFloatingWindow(0.6, 0.6)')
" nmap <silent>gp :<C-U>PreviewDefinition<CR>
" nmap <leader>k :<C-U>PreviewDefinition<CR>
" nmap <silent> gp :call CocAction('jumpDefinition', 'copen')<CR>

" format mysql connection command
command! ConvertAllDSNToMyCLI call ConvertAllDSNToMyCLIFunc()
func! ConvertAllDSNToMyCLIFunc()
    " :%s/^\s*"dsn": "\(.*\):\(.*\)@tcp(\(.*\):\(\d*\))\/\(\w*\)?.*$/mycli -h \3 -P \4 -u \1 -p \2 -D \5/
    :%s/^\s*"\?dsn"\?\s*[:=]\s*"\(.*\):\(.*\)@tcp(\(.*\):\(\d*\))\/\(\w*\)?.*$/mycli -h \3 -P \4 -u \1 -p \2 -D \5/
endfunc

command! TidyJIRA call TidyJIRAFunc()
func! TidyJIRAFunc()
    :set ft=markdown
    :v/SPPC/d
    :g/BE/norm dtB
    :%s/\(SPPC-\d*\)\s*/[[\1](https:\/\/jira.shopee.io\/browse\/\1)]/
    :g/SPPC/norm J
    :%norm A  
endfunc

command! ParseOff call ParseOffFunc()
func! ParseOffFunc()
    :set ft=
    :set syn=
    :syntax off
    :set nowrap
endfunc

command! FindGinAPIPattern /\v(GET|PUT|POST)\(

if has('mac')
  function! TyporaLaunch()
      " Launch Typora
      call system("open -a Typora \"" . expand("%") . "\"")
      setlocal autoread
  endfunction

  command! Typora call TyporaLaunch()
endif

command! FindConflict /\v^(<<<<<<|>>>>>>|======)

command! SumNumbers call SumNumbers()
function! SumNumbers()
    :%!awk '{sum+=$1} END {print "Total: "sum}'
endfunction

