" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker nospell:

call plug#begin('~/.config/nvim/plugins')

" ===
" === basic
" ===
Plug 'bling/vim-bufferline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'Yggdroot/indentLine'
Plug 'chiel92/vim-autoformat'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-expand-region'
" show mark
Plug 'kshenoy/vim-signature'

" reg list
Plug 'junegunn/vim-peekaboo'

" easymotion {
Plug 'easymotion/vim-easymotion'
nmap ss <Plug>(easymotion-s2)
" }

" nerdtree-git-plugin {
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "mdf",
    \ "Staged"    : "stg",
    \ "Untracked" : "utk",
    \ "Renamed"   : "rnm",
    \ "Unmerged"  : "umg",
    \ "Deleted"   : "dlt",
    \ "Dirty"     : "dty",
    \ "Clean"     : "cln",
    \ 'Ignored'   : "ign",
    \ "Unknown"   : "ukn"
    \ }
let g:NERDTreeUpdateOnWrite = 0
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
" === input method
" ===
Plug 'lilydjwg/fcitx.vim'

" ===
" === filer
" ===
" nerdtree {
Plug 'scrooloose/nerdtree'
map <c-e> :NERDTreeToggle<cr>
let g:NERDChristmasTree=0
let g:NERDTreeWinSize=30
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '__pycache__', '\.vscode']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinPos = 'left'
let g:NERDTreeHidden=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" close if nerdtree is the last window left
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
" }

" ===
" === search
" ===
" leaderf {
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_ReverseOrder = 1
nnoremap <leader>sf :Leaderf<space>rg<cr>
" }

" fzf {
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" find file
nnoremap <c-p> :FZF<cr>
nnoremap <leader>p :FZF<cr>
nnoremap <leader>rg :Rg<cr>
nnoremap <leader>ag :Ag<cr>

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:50%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:50%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)
" }

" ===
" === format
" ===
" tabular
Plug 'godlygeek/tabular'

" object-after {
Plug 'junegunn/vim-after-object'
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" }

" table-mode {
Plug 'dhruvasagar/vim-table-mode'
nnoremap <leader>tm :TableModeToggle
" }

" vim-easy-align {
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }


" ===
" === autocomplete
" ===
" coc {
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-json', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-highlight', 'coc-json', 'coc-explorer']

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
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>

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

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

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
nmap <silent> <TAB> <Plug>(coc-range-select)
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

" coc-highlight {
autocmd CursorHold * silent call CocActionAsync('highlight')
" }

" untisnips & vim-snippets {
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/ultisnips/', 'ultisnips']

" }

" ===
" === language
" ===
" vim-go {
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
let g:go_version_warning = 0
let g:go_highlight_functions = 1
let g:go_highlight_function_calls  =  1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = -1
let g:go_highlight_types  =  1
let g:go_highlight_fields  =  1
let g:go_highlight_extra_types = 1
let g:go_fmt_command = "goimports"
let g:go_decls_includes = "func"
let g:go_decls_includes = "func,type"
let g:go_def_mode = 'godef'
let g:go_info_mode = 'gocode'
" }

" python-mode {
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" }

" ===
" === theme
" ===
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'

" rainbow {
Plug 'luochen1990/rainbow'
let g:rainbow_active=1
" }

call plug#end()
