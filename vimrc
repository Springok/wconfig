call plug#begin()
"================================================
" Enhance Vim
"================================================
Plug 'bootleq/vim-cycle'

"================================================
" Dev Tools
"================================================
Plug 'tpope/vim-dispatch'
Plug 'bootleq/vim-qrpsqlpq'
Plug 'thinca/vim-quickrun', {'commit': 'c980977f1d77b3285937b9d7b5baa964fc9ed7f5'}

call plug#end()

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

"================================================
" Shortcut
"================================================

" vim-cycle
nmap <silent> gs <Plug>CycleNext
vmap <silent> gs <Plug>CycleNext

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
