call plug#begin()
"================================================
" Enhance Vim
"================================================
Plug 'austintaylor/vim-indentobject'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'bootleq/vim-cycle'

" Navigation
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'

"================================================
" Dev Tools
"================================================
Plug 'dyng/ctrlsf.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-dispatch'
Plug 'bootleq/vim-qrpsqlpq'
Plug 'thinca/vim-quickrun', {'commit': 'c980977f1d77b3285937b9d7b5baa964fc9ed7f5'}
Plug 'majutsushi/tagbar'

"================================================
" Clojure
"================================================
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-fireplace' " Navigating and Comprehending
" Plug 'clojure-vim/clojure.vim'

Plug 'Olical/conjure'
Plug 'clojure-vim/vim-jack-in'

call plug#end()

set nrformats+=alpha

syntax on
filetype plugin indent on

" CtrlSF
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_ignore_dir = ['vendor/assets', 'public/eva/js/', 'cljs-runtime', 'node_modules', 'db']
let g:ctrlsf_indent = 2
let g:ctrlsf_mapping = {
\ "split"   : "gi",
\ "vsplit"  : "gs"
\ }

" Ale =========
let g:ale_linters = {
\   'ruby': ['rubocop', 'ruby'],
\   'clojure': ['clj-kondo'],
\}

" https://github.com/dense-analysis/ale/pull/1850, make it work with bundle
let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1

" run sql file to give your the result table!
" usage: <leader_key>p + j, l, r
function! s:init_qrpsqlpq()
  nmap <buffer> <Leader>p [qrpsqlpq]
  nnoremap <silent> <buffer> [qrpsqlpq]j :call qrpsqlpq#run('split')<CR>
  nnoremap <silent> <buffer> [qrpsqlpq]l :call qrpsqlpq#run('vsplit')<CR>
  nnoremap <silent> <buffer> [qrpsqlpq]r :call qrpsqlpq#run()<CR>

  if !exists('b:rails_root')
    call RailsDetect()
  endif
  if !exists('b:rails_root')
    let b:qrpsqlpq_db_name = 'postgres'
  endif
endfunction

if executable('psql')
  let g:qrpsqlpq_expanded_format_max_lines = -1
  autocmd FileType sql call s:init_qrpsqlpq()
endif

" Conjure
let g:conjure#log#hud#width = 0.7
let g:conjure#log#hud#height = 0.7
let g:conjure#log#hud#anchor = "SE"
let g:conjure#highlight#enable = 'true'
" let g:conjure#mapping#prefix = ",c"
let g:conjure#log#botright = 'true'
nnoremap ,ccs :ConjureShadowSelect app<CR>

let g:sexp_enable_insert_mode_mappings = 0

"================================================
" Shortcut
"================================================
nnoremap <leader>] :TagbarToggle<CR>
noremap <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

command! -bang -nargs=* Rg
      \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" CtrlSF search (replace ag.vim)
nmap     <leader>ff <Plug>CtrlSFPrompt
nmap     <leader>fc <Plug>CtrlSFCwordExec
vmap     <leader>ff <Plug>CtrlSFVwordPath
vmap     <leader>fF <Plug>CtrlSFVwordExec
nmap     <leader>fp <Plug>CtrlSFPwordPath
nnoremap <leader>fo :CtrlSFOpen<CR>
nnoremap <leader>ft :CtrlSFToggle<CR>
inoremap <leader>ft <Esc>:CtrlSFToggle<CR>

" vim-cycle
nmap <silent> gs <Plug>CycleNext
vmap <silent> gs <Plug>CycleNext

" change SpellBad style, have to do this after colorscheme setup, otherwise will be overwritten
hi SpellBad ctermbg=20

function! s:case_tx_subs_camel(w) "{{{
  let w = substitute(a:w, '-', '_', 'g')
  return substitute(w, '_\([a-z]\)', '\u\1', 'g')
endfunction "}}}

function! s:case_tx_subs_kekab(w) "{{{
  let w = s:case_tx_subs_snake(a:w)
  return tr(w, '_', '-')
endfunction "}}}

function! s:case_tx_subs_snake(w) "{{{
  let w = substitute(a:w, '-', '_', 'g')
  return substitute(w, '\C[A-Z]', '_\L\0', 'g')
endfunction "}}}

let s:case_tx_patterns = {
      \ 'snake': '_',
      \ 'kekab': '-',
      \ 'camel': '\C[a-z][A-Z]',
      \ }

function! WordTransform()
  let save_isk = &l:iskeyword
  let cases = get(b:, 'case_tx_cases', ['snake', 'camel'])

  try
    let &l:isk = '@,48-57,-,_'
    let w = expand("<cword>")
    let x = ''
    let c = strpart(getline('.'), col('.') - 1, 1)

    for [k, pattern] in items(s:case_tx_patterns)
      if match(w, pattern) > -1
        let next_k = get(repeat(cases, 2), index(cases, k) + 1)
        let x = call(function('s:case_tx_subs_' . next_k), [w])
        silent! call repeat#set(',x') " must match your mapping to WordTransform()
        break
      end
    endfor

    if x == w || empty(x)
      echohl WarningMsg | echomsg "Nothing to transform." | echohl None
      return
    endif

    if match(w, c) < 0   " cursor might sit before keyword
      execute "normal! f" . strpart(w, 0, 1)
      execute "normal! \"_ciw\<C-R>=x\<CR>"
    else
      execute "normal! \"_ciw\<C-R>=x\<CR>"
    endif
  finally
    let &l:isk = save_isk
  endtry
endfunction

let b:case_tx_cases = ['snake', 'kekab', 'camel']
nnoremap <silent> <LocalLeader>x :call WordTransform()<CR>

" keep set secure on the last line
set secure " safer working with script files in the current directory