let fancy_symbols_enabled = 1
" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.
" Tagbar -----------------------------
    " toggle tagbar display
    map <F4> :TagbarToggle<CR>
    " autofocus on tagbar open
    let g:tagbar_autofocus = 1

" NERDTree -----------------------------
    " toggle nerdtree display
    map <F3> :NERDTreeToggle<CR>
    " open nerdtree with the current file selected
    nmap ,t :NERDTreeFind<CR>
    " don;t show these file types
    let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
    let NERDTreeShowLineNumbers=1
    autocmd FileType nerdtree setlocal relativenumber
    
" Enable folder icons
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    let g:DevIconsEnableFoldersOpenClose = 1
    
    " Fix directory colors
    highlight! link NERDTreeFlags NERDTreeDir

    " Remove expandable arrow
    let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
    let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
    let NERDTreeDirArrowExpandable = "\u00a0"
    let NERDTreeDirArrowCollapsible = "\u00a0"
    let NERDTreeNodeDelimiter = "\x07"

    " Autorefresh on tree focus
    function! NERDTreeRefresh()
        if &filetype == "nerdtree"
            silent exe substitute(mapcheck("R"), "<CR>", "", "")
        endif
    endfunction
    
    autocmd BufEnter * call NERDTreeRefresh()

    function! Captura()
        :!captura
        :pu
    endfunction

" Tasklist ------------------------------
    " show pending tasks list
    map <F2> :TaskList<CR>
    
" Fzf ------------------------------
    " file finder mapping
    nmap ,e :Files<CR>
    " tags (symbols) in current file finder mapping
    nmap ,g :BTag<CR>
    " the same, but with the word under the cursor pre filled
    nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
    " tags (symbols) in all files finder mapping
    nmap ,G :Tags<CR>
    " the same, but with the word under the cursor pre filled
    nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
    " general code finder in current file mapping
    nmap ,f :BLines<CR>
    " the same, but with the word under the cursor pre filled
    nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
    " general code finder in all files mapping
    nmap ,F :Lines<CR>
    " the same, but with the word under the cursor pre filled
    nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
    " commands finder mapping
    nmap ,c :Commands<CR>

" Jedi-vim ------------------------------
    " Disable autocompletion (using deoplete instead)
    let g:jedi#completions_enabled = 0
    
    " All these mappings work only for python code:
    " Go to definition
    let g:jedi#goto_command = ',d'
    " Find ocurrences
    let g:jedi#usages_command = ',o'
    " Find assignments
    let g:jedi#goto_assignments_command = ',a'
    " Go to definition in new tab
    nmap ,D :vertical split<CR>:call jedi#goto()<CR>


" Ack.vim ------------------------------
    " mappings
    nmap ,r :Ack 
    nmap ,wr :execute ":Ack " . expand('<cword>')<CR>

" Yankring -------------------------------
    let g:yankring_history_dir = '~/.config/nvim/tmp'
    let g:yankring_clipboard_monitor = 0

" Airline ------------------------------
    let g:airline_powerline_fonts = 0
    let g:airline_theme = 'bubblegum'
    let g:airline#extensions#whitespace#enabled = 0

" Fancy Symbols!!
    if fancy_symbols_enabled
        let g:webdevicons_enable = 1
        " custom airline symbols
        if !exists('g:airline_symbols')
        let g:airline_symbols = {}
        endif
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = '⭠'
        let g:airline_symbols.readonly = '⭤'
        let g:airline_symbols.linenr = '⭡'
    else
        let g:webdevicons_enable = 0
    endif

let g:user_emmet_leader_key=' '

if vim_plug_just_installed
  :CocInstall coc-python
endif

function! LinterStatus() abort
  set statusline=
  set statusline+=%m
  set statusline+=\ %f
  set statusline+=%=
  set statusline+=\ %{LinterStatus()}
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction



let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \    'python': ['yapf', 'autopep8', 'isort'],
      \}

nmap <F10> :ALEFix<CR>
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

"colorscheme
    colorscheme gruvbox
    let g:gruvbox_contrast_dark='hard'
    set background=dark
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none


function! Captura()
  :!captura
  :pu
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:jupytext_fmt = 'py'

"airline symbols
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    
    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = 'Ξ'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'

let g:snips_author="Alexandre Castro"
let g:snips_email="im.alexandre07@gmail.com"
let g:snips_github="https://www.github.com/im-alexandre"

let fancy_symbols_enabled = 1

set completefunc=emoji#complete
