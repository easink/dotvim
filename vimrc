" Modeline and Notes {
"   vim: set foldmarker={,} foldlevel=0 spell:
"
"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the "   pieces you want(and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen.
" }

" vim-plug {
    " Run this first...
    if has('nvim')
        call plug#begin('~/.vim/plugged.nvim')
    else
        call plug#begin('~/.vim/plugged')
    endif

    " " Special build function for YCM
    " function! BuildYCM(info)
    "     " info is a dictionary with 3 fields
    "     " - name:   name of the plugin
    "     " - status: 'installed', 'updated', or 'unchanged'
    "     " - force:  set on PlugInstall! or PlugUpdate!
    "     if a:info.status == 'installed' || a:info.force
    "         !python3 ./install.py
    "         " !python3 ./install.py --clang-completer
    "     endif
    " endfunction

    " Plugins

    " for the looks
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'godlygeek/csapprox'
    Plug 'easink/mustang'
    " Plug 'bmcilw1/mustang-vim'
    " Plug 'TheMrNomis/mustang-vim'
    Plug 'gruvbox-community/gruvbox'
    Plug 'altercation/vim-colors-solarized'
    Plug 'amacdougall/Birds-of-Paradise-VIM-Theme'
    Plug 'ap/vim-buftabline'

    " features
    Plug 'haya14busa/incsearch.vim'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-projectionist'
    "Plug 'ctrlpvim/ctrlp.vim'
    set rtp+=~/.fzf
    Plug 'junegunn/fzf'
    Plug 'chrisbra/Recover.vim'
    Plug 'kabbamine/zeavim.vim'

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'gregsexton/gitv'
    "Plug 'tpope/vim-git'
    "Plug 'http://www.tidraso.co.uk/repository/vim-plugin/'

    " text objects
    Plug 'wellle/targets.vim'
    Plug 'tpope/vim-jdaddy'
    Plug 'sukima/xmledit'
    Plug 'godlygeek/tabular'
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-indent'
    Plug 'kana/vim-textobj-function'
    Plug 'bps/vim-textobj-python', { 'for': 'python' }
    Plug 'idbrii/textobj-word-column.vim'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'jeetsukumaran/vim-indentwise'
    Plug 'libclang-vim/libclang-vim'
    Plug 'libclang-vim/vim-textobj-clang'
    Plug 'aoswalt/vim-textobj-elixir'

    " markdown
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    " Plug 'plasticboy/vim-markdown'

    " coding
    Plug 'majutsushi/tagbar'
    "Plug 'msanders/snipmate.vim'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'tandrewnichols/vim-contemplate'
    " Plug 'vim-syntastic/syntastic'
    Plug 'w0rp/ale'
    " Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-commentary'
    " python bundles
    " Plug 'klen/python-mode', { 'for': 'python' }
    Plug 'davidhalter/jedi-vim',
    " Plug 'davidhalter/jedi-vim' | Plug 'lambdalisue/vim-pyenv'
    Plug 'janko-m/vim-test'
    "

    " python/c/c++ bundles
    " " Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'neoclide/coc-pyls', {'do': 'yarn install --frozen-lockfile'}
    " Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
    " Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
    " " Plug 'neoclide/coc-ultisnips', {'do': 'yarn install --frozen-lockfile'}
    if has('nvim')
        " Plug 'roxma/nvim-completion-manager'
        Plug 'roxma/nvim-yarp'
        Plug 'ncm2/ncm2'
        Plug 'ncm2/ncm2-bufword'
        " " Plug 'ncm2/ncm2-tmux'
        Plug 'ncm2/ncm2-path'
        Plug 'ncm2/ncm2-ultisnips'
        Plug 'prabirshrestha/async.vim'
        Plug 'prabirshrestha/vim-lsp'
        Plug 'ncm2/ncm2-vim-lsp'
        Plug 'thomasfaingnaert/vim-lsp-snippets'
        Plug 'thomasfaingnaert/vim-lsp-ultisnips'


        " Plug 'ncm2/float-preview.nvim'
        " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        " Plug 'autozimu/LanguageClient-neovim', {
        "             \ 'branch': 'next',
        "             \ 'do': 'bash install.sh',
        "             \ }
        " Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
        " Plug 'roxma/ncm-clang'
        " Plug 'roxma/ncm-elm-oracle'
    else
        Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
        " Plug 'oblitum/YouCompleteMe', { 'do': function('BuildYCM') }
    endif
    " Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
    " Plug 'tenfyzhong/CompleteParameter.vim'
    " Plug 'Rip-Rip/clang_complete'
    Plug 'derekwyatt/vim-fswitch'
    " puppet - well, not really coding
    Plug 'rodjek/vim-puppet'

    " Elixir
    Plug 'elixir-lang/vim-elixir'
    Plug 'mhinz/vim-mix-format'
    if has('nvim')
        " Plug 'awetzel/elixir.nvim'
    else
        Plug 'slashmili/alchemist.vim'
    endif

    " Elm
    Plug 'ElmCast/elm-vim'
    " fix incompability
    let g:polyglot_disabled = ['elm']

    " Golang
    Plug 'fatih/vim-go'

    " Rust
    Plug 'rust-lang/rust.vim'

    " Html
    Plug 'mattn/emmet-vim'

    " *-lang
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-endwise'

    " End
    call plug#end()

    " Load matchit.vim, but only if the user hasn't installed a newer version.
    if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
        runtime! macros/matchit.vim
    endif
" }

" Basics {
    set nocompatible     "  explicitly get out of vi-compatible mode
    set noexrc           "  don't use local version of .(g)vimrc, .exrc
    "set background=dark "  we plan to use a dark background
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor
    "             ||||||||     between joined lines
    "             |||||||+-- When a new match is created (showmatch)
    "             |||||||     pause for .5
    "             ||||||+-- Set buffer options when entering the
    "             ||||||     buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> to the last line
    "             ||||     when using :@r
    "             |||+-- Searching continues at the end of the match
    "             |||     at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    syntax on " syntax highlighting on

    " set background=light
    colorscheme mustang
    " colorscheme solarized
    " colorscheme gruvbox
    " colorscheme birds_of_paradise
    "complement to mustang...
    :hi ColorColumn guibg=#2d2d2d ctermbg=236
" }

" General {
    filetype plugin indent on        " load filetype plugins/indent settings

    "set autochdir                   " always switch to the current file directory
    set backspace=indent,eol,start   " make backspace a more flexible
    " set undofile                     " make persistent undo files throughout sessions
    " set undodir=~/.vim/undodir       " where to put undo files
    set backup                       " make backup files
    set backupdir=~/.vim/backup      " where to put backup files
    "set clipboard+=unnamed          " share windows clipboard
    set directory=~/.vim/tmp         " directory to place swap files in
    "set fileformats=unix,dos,mac    " support all three, in this order
    set hidden                       " you can change buffers without saving
    "(XXX: #VIM/tpope warns the line below could break things)
    set iskeyword+=_,$,@,%,#         " none of these are word dividers
    "set mouse=a                     " use mouse everywhere
    set noerrorbells                 " don't make noise
    "set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "              | | | | | | | | |
    "              | | | | | | | | +-- "]" Insert and Replace
    "              | | | | | | | +-- "[" Insert and Replace
    "              | | | | | | +-- "~" Normal
    "              | | | | | +-- <Right> Normal and Visual
    "              | | | | +-- <Left> Normal and Visual
    "              | | | +-- "l" Normal and Visual (not recommended)
    "              | | +-- "h" Normal and Visual (not recommended)
    "              | +-- <Space> Normal and Visual
    "              +-- <BS> Normal and Visual
    set wildmenu                    " turn on command line completion wild style
    "ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
    set wildmode=list:longest:full   " turn on wild mode huge list
" }

" Vim UI {
    set colorcolumn=120          " highligth column 120
    "set cursorcolumn            " highlight the current column
    "set cursorline              " highlight current line
    set incsearch                " BUT do highlight as you type you search phrase
    set laststatus=2             " always show the status line
    set lazyredraw               " do not redraw while running macros
    set linespace=0              " don't insert any extra pixel lines betweens rows
    set list                     " we do what to show tabs, to ensure we get them out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=5              " how many tenths of a second to blink matching brackets for
    set hlsearch                 " highlight searched for phrases
    set nostartofline            " leave my cursor where it was
    set novisualbell             " don't blink
    set number                   " turn on line numbers
    set relativenumber           " turn on relative line numbers
    set numberwidth=4            " We are good up to 9999 lines
    "set report=0                " tell us when anything is changed via :...
    set ruler                    " Always show current positions along the bottom
    set scrolloff=10             " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT          " shortens messages to avoid 'press a key' prompt
    set showcmd                  " show the command being typed
    set showmatch                " show matching brackets
    set sidescrolloff=10         " Keep 5 lines at the size
    "set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%l,%v]%=%{fugitive#statusline()}
    set statusline=[%n]\ %t\ %F\ %m%r%h%w%{fugitive#statusline()}%=%y\ [%{&ff}]\ %l,%v\ %p%%
    "                         | | | | |  |   |      |  |     |    |
    "                         | | | | |  |   |      |  |     |    + current
    "                         | | | | |  |   |      |  |     |       column
    "                         | | | | |  |   |      |  |     +-- current line
    "                         | | | | |  |   |      |  +-- current % into file
    "                         | | | | |  |   |      +-- current syntax in
    "                         | | | | |  |   |          square brackets
    "                         | | | | |  |   +-- current fileformat
    "                         | | | | |  +-- number of lines
    "                         | | | | +-- preview flag in square brackets
    "                         | | | +-- help flag in square brackets
    "                         | | +-- readonly flag in square brackets
    "                         | +-- rodified flag in square brackets
    "                         +-- full path to file in the buffer
" }

" Text Formatting/Layout {
    "set completeopt=menuone " show pop up menu for completions
    "set completeopt=menu,menuone,longest " show pop up menu for completions
    set completeopt-=preview " show pop up menu for completions
    " set diffopt+=algorithm:patience  " better diff
    set formatoptions=rq   " Automatically insert comment leader on return, and let gq format comments
    set ignorecase         " case insensitive by default
    set infercase          " case inferred by default
    set nowrap             " do not wrap line
    set shiftround         " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase          " if there are caps, go case-sensitive
    set shiftwidth=4       " auto-indent amount when using cindent, >>, << and stuff like that
    set softtabstop=4      " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
    set tabstop=4          " real tabs should be 8, and they will show with set list on
    "set smarttab           " ????
    set expandtab          " no real tabs please!
" }

" Folding {
    set foldenable                                     " Turn on folding
    set foldmarker={,}                                 " Fold C style code (only use this as default
                                                       " if you use a high foldlevel)
    set foldmethod=marker                              " Fold on the marker
    set foldlevel=100                                  " Don't autofold anything (but I can still fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag   " what movements
                                                       " open folds
    function SimpleFoldText()                          " {
        return getline(v:foldstart).' '
    endfunction                                        " }
    set foldtext=SimpleFoldText()                      " Custom fold text function
                                                       " (cleaner than default)
" }

" Plugin Settings {
    let b:match_ignorecase = 1 " case is stupid
    let perl_extended_vars=1   " highlight advanced perl vars inside strings

    " Buftabline
    let g:buftabline_show = 1   " show when at least two buffers exists
    let g:buftabline_numbers = 1

    " Pandoc
    let g:pandoc#spell#enabled = 0  " bad highlighting

    " ncm2
    " Press enter key to trigger snippet expansion
    " The parameters are the same as `:help feedkeys()`

    " let g:deoplete#enable_at_startup = 1
    autocmd BufEnter * call ncm2#enable_for_buffer()
    set completeopt=noinsert,menuone,noselect
    " noselect -> crash when vim-snippet/ultisnips/languageclient " (snippet-lsp)
    " set completeopt=noinsert,menuone
    set shortmess+=c

    " " When the <Enter> key is pressed while the popup menu is visible, it only
    " " hides the menu. Use this mapping to close the menu and also start a new
    " " line.
    " inoremap <silent> <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    " inoremap <silent> <expr> <c-j> ncm2_ultisnips#expand_or("\<c-j>", 'n')
    " inoremap <silent> <expr> <cr> ncm2_ultisnips#expand_or("\<cr>", 'n')

    " au TextChangedI * call ncm2#auto_trigger()

    " YouCompleteMe
    ""let g:ycm_filetype_specific_completion_to_disable = {python}    " disable python code completion
    " let g:ycm_autoclose_preview_window_after_completion = 1
    " let g:ycm_autoclose_preview_window_after_insertion = 1
    " let g:ycm_use_ultisnips_completer = 1
    " let g:ycm_seed_identifiers_with_syntax = 1
    " let g:ycm_confirm_extra_conf = 0
    ""let g:ycm_key_list_selection = ['<Down>']

    " Virtualenv + YouCompleteMe
    " if isdirectory($VIRTUAL_ENV)
    "     " let name = fnamemodify($VIRTUAL_ENV, ':t')
    "     let g:ycm_python_binary_path = $VIRTUAL_ENV.'/bin/python'
    " endif

    " Elixir
    " let g:alchemist#elixir_erlang_src = "${HOME}/source/erlang/"

    " let g:mix_format_on_save = 1
    " let g:mix_format_options = '--check-equivalent'
    " let g:mix_format_silent_errors = 1

    " Language Server
    " Required for operations modifying multiple buffers like rename.
    " set hidden

    " let g:LanguageClient_serverCommands = {
    "      \ 'c': ['clangd'],
    "      \ 'cpp': ['clangd'],
    "      \ 'css': ['css-languageserver', '--stdio'],
    "      \ 'dockerfile': ['docker-langserver', '--stdio'],
    "      \ 'elixir': ['language_server.sh'],
    "      \ 'eelixir': ['language_server.sh'],
    "      \ 'go': ['go-langserver', '-gocodecompletion'],
    "      \ 'html': ['html-languageserver', '--stdio'],
    "      \ 'javascript': ['javascript-typescript-stdio'],
    "      \ 'javascript.jsx': ['javascript-typescript-stdio'],
    "      \ 'puppet': ['puppet-langserver.sh'],
    "      \ 'python': ['pyls'],
    "      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    "      \ 'sh': ['bash-language-server', 'start'],
    "      \ 'vim': ['vim-language-server', '--stdio'],
    "      \ 'yaml': ['yaml-language-server', '--stdio'],
    "      \ }

    " let g:LanguageClient_rootMarkers = {
    "      \ 'elixir': ['mix.exs'],
    "      \ }

    " let g:LanguageClient_loggingFile = '/tmp/languageclient.log'
    " " let g:LanguageClient_loggingLevel = 'INFO'
    " let g:LanguageClient_loggingLevel = 'DEBUG'

    " " let g:LanguageClient_completionPreferTextEdit = 1

    " " Automatically start language servers.
    " let g:LanguageClient_autoStart = 1

    " " let g:LanguageClient_diagnosticsSignsMax = 0
    " let g:LanguageClient_useFloatingHover = 1
    " let g:LanguageClient_useVirtualText = "All"
    " let g:LanguageClient_hasSnippetSupport = 1
    " let g:LanguageClient_changeThrottle = 0.5
    " let g:LanguageClient_virtualTextPrefix = "    ••➜ "
    " " let g:LanguageClient_diagnosticsList = "Location"
    " let g:LanguageClient_selectionUI = "location-list"
    " let g:LanguageClient_hoverpreview = "Always"
    " " Share Language Server config between vscode and neovim
    " " let g:LanguageClient_settingsPath = $WORKSPACE_DIR . "/.vscode/settings.json"
    " " let g:LanguageClient_settingsPath = $WORKSPACE_DIR . '/.vim/settings.json'

    " VIM-LSP

    let g:lsp_log_verbose = 1
    let g:lsp_log_file = expand('~/vim-lsp.log')

    " for asyncomplete.vim log
    let g:asyncomplete_log_file = expand('~/asyncomplete.log')

    if executable('clangd')
        augroup vim_lsp_cpp
            autocmd!
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name':      'clangd',
                        \ 'cmd':       {server_info->['clangd']},
                        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                        \ })
            autocmd FileType c,cpp,objc,objcpp,cc setlocal omnifunc=lsp#complete
        augroup end
    endif

    if executable('language_server.sh')
        augroup vim_lsp_elixir
            autocmd!
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name':      'elixir',
                        \ 'cmd':       {server_info->['language_server.sh']},
                        \ 'whitelist': ['elixir', 'eelixir'],
                        \ })
            autocmd FileType ex,exs,eex,leex setlocal omnifunc=lsp#complete
        augroup end
    endif

    if executable('rls')
        augroup vim_lsp_rust
            autocmd!
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name':      'rust',
                        \ 'cmd':       {server_info->['rls']},
                        \ 'whitelist': ['rust'],
                        \ })
            autocmd FileType rs setlocal omnifunc=lsp#complete
        augroup end
    endif

    if executable('pyls')
        augroup vim_lsp_python
            autocmd!
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name':      'pyls',
                        \ 'cmd':       {server_info->['pyls']},
                        \ 'whitelist': ['python'],
                        \ })
            autocmd FileType py setlocal omnifunc=lsp#complete
        augroup end
    endif

    if executable('typescript-language-server')
        augroup vim_lsp_js
            autocmd!
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name':      'typescript/javascript',
                        \ 'cmd':       {server_info->['typescript-language-server --stdio']},
                        \ 'whitelist': ['javascript', 'typescript'],
                        \ })
            autocmd FileType js setlocal omnifunc=lsp#complete
        augroup end
    endif

    if executable('bash-language-server')
        augroup vim_lsp_sh
            autocmd!
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name':      'sh',
                        \ 'cmd':       {server_info->['bash-language-server', 'start']},
                        \ 'whitelist': ['sh'],
                        \ })
            autocmd FileType sh setlocal omnifunc=lsp#complete
        augroup end
    endif

    function! s:on_lsp_buffer_enabled() abort
        setlocal omnifunc=lsp#complete
        " setlocal signcolumn=yes
        " nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
        nmap <buffer> K <plug>(lsp-hover)
        nmap <buffer> gd <plug>(lsp-definition)
        " nmap <buffer> gr <plug>(lsp-references)
        nmap <buffer> <f2> <plug>(lsp-rename)

        " refer to doc to add more commands
    endfunction

    augroup lsp_install
        au!
        " call s:on_lsp_buffer_enabled only for languages that has the server registered.
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END

    " jedi-vim {
    " disable completion
    let g:jedi#auto_initialization = 1
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#smart_auto_mappings = 0
    let g:jedi#popup_on_dot = 1
    let g:jedi#popup_select_first = 0
    let g:jedi#completions_enabled = 1
    let g:jedi#completions_command = ""
    " let g:jedi#show_call_signatures = 2
    let g:jedi#show_call_signatures = "1"
    let g:jedi#show_call_signatures_delay = 0

    let g:jedi#goto_assignments_command = "<leader>ja"
    let g:jedi#goto_definitions_command = "<leader>jd"
    let g:jedi#documentation_command = "<leader>jk"
    let g:jedi#usages_command = "<leader>ju"
    let g:jedi#rename_command = "<leader>jr"
    " }

    " elm {
    " disable polyglot
    let g:polyglot_disabled = ['elm']
    " enable ycm
    " let g:ycm_semantic_triggers = { 'elm' : ['.'], }
    " }

    " vim-go {
    " highlights
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_types = 1

    " highlight variables with same name
    let g:go_auto_sameids = 1

    " autoimport
    let g:go_fmt_command = "goimports"

    " print typo
    let g:go_auto_type_info = 1
    let g:go_info_mode = 'guru'

    " add tags (snakecase/camelcase)
    let g:go_addtags_transform = "snakecase"

    " choose snippet engine
    " let g:go_snippet_engine = "ultisnips"

    " Ale
    " let g:ale_sign_error = '⤫'
    " let g:ale_sign_warning = '⚠'
    " let g:ale_linters = {'go': ['gometalinter']}
    let g:ale_linters = {
    \ 'elixir': ['credo', 'dialyxir', 'elixir-ls', 'mix'],
    \ 'go': ['gometalinter']
    \ }
    let g:ale_fix_on_save = 1
    let g:ale_fixers = {
    \   'elixir': ['mix_format'],
    \   'python': ['yapf'],
    \}
    " }
    " \   '*': ['remove_trailing_lines', 'trim_whitespace'],

    " Ultisnips / LSP snippets workaround (to remove later...)
    " function! ExpandLspSnippet()
    "     call UltiSnips#ExpandSnippetOrJump()
    "     if !pumvisible() || empty(v:completed_item)
    "         return ''
    "     endif
    "
    "     " only expand Lsp if UltiSnips#ExpandSnippetOrJump not effect.
    "     let l:value = v:completed_item['word']
    "     let l:matched = len(l:value)
    "     if l:matched <= 0
    "         return ''
    "     endif
    "
    "     " remove inserted chars before expand snippet
    "     if col('.') == col('$')
    "         let l:matched -= 1
    "         exec 'normal! ' . l:matched . 'Xx'
    "     else
    "         exec 'normal! ' . l:matched . 'X'
    "     endif
    "
    "     if col('.') == col('$') - 1
    "         " move to $ if at the end of line.
    "         call cursor(line('.'), col('$'))
    "     endif
    "
    "     " expand snippet now.
    "     call UltiSnips#Anon(l:value)
    "     return ''
    " endfunction
    "
    " imap <C-j> <C-R>=ExpandLspSnippet()<CR>
    " imap <silent> <CR> <C-r>=ExpandLspSnippet()<CR>

    " Ultisnips

    " imap <expr> <c-j> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_expand)", 'm')
    "
    " smap <c-j> <Plug>(ultisnips_expand)
    " inoremap <expr> <c-j> ncm2_ultisnips#expand_or("\<Plug>(ncm2_ultisnips_expand_completed)", 'm')
    " snoremap <c-j> <Plug>(ncm2_ultisnips_expand_completed)

    imap <expr> <c-j> "\<c-y>\<Plug>(ncm2_ultisnips_expand_completed)"
    " inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
    " imap <expr> <CR> (pumvisible() ? "\<C-Y>\<Plug>(expand_or_cr)" : "\<CR>")
    " imap <expr> <Plug>(expand_or_cr) (ncm2_ultisnips#completed_is_snippet() ? "\<C-U>" : "\<CR>")
    " let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
    " inoremap <silent> <C-U> <C-R>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<CR>
    "
    " inoremap <silent> <expr> <CR> <c-r>=ncm2_ultisnips#expand_or("\<CR>", 'n')
    " inoremap <silent> <expr> <CR> pumvisible()? <c-r>=ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>"


    "let g:UltiSnipsEditSplit = "vertical"
    " let g:UltiSnipsListSnippets = "<c-h>"
    " let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsExpandTrigger  = "<Plug>(ultisnips_expand)"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    " disable digraphs, I dont use 'em
    inoremap <c-k> <NOP>
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    let g:UltiSnipsRemoveSelectModeMappings = 0
    " " optional
    " inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
    " inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    " inoremap <expr><cr> pumvisible() ? "\<c-n>" : "\<tab>"

    " imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
    " imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-j>":"\<CR>")
    " inoremap <silent> <c-j> <c-r>=(ncm2_ultisnips#completed_is_snippet() ? ncm2_ultisnips_expand_completed() : "\<c-j>")
    " inoremap <silent> <c-j> <c-r>=(ncm2_ultisnips#completed_is_snippet() ? ncm2#ncm2_ultisnips_expand_completed() : "\<c-j>")

    " imap <expr> <Plug>(ncm2_ultisnips_expand_completed) (ncm2_ultisnips#completed_is_snippet() ? "\<C-j>":"\<CR>")

    " inoremap <silent> <expr> <c-j> <c-r>=ncm2_ultisnips#expand_or("\<c-j>", 'n')
    " inoremap <silent> <expr> <cr> <c-r>=(ncm2_ultisnips#completed_is_snippet() ? "\<Plug>(ncm2_ultisnips_expand_completed)" : "\<cr>")
    " snoremap <silent> <expr> <c-j> ncm2_ultisnips#expand_or("\<c-j>", 'n')
    " inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
    " inoremap <expr> <CR> (pumvisible() ? "\<C-Y>\<Plug>(expand_or_cr)" : "\<CR>")

    """" map <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
    " imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")

    " inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

" }

" Mappings {
    let mapleader = ","
    let maplocalleader = ","
    " dont invalid vim function
    nnoremap \ ,

    " Force me to ignore arrow keys
    noremap <left> <nop>
    noremap <right> <nop>
    noremap <up> <nop>
    noremap <down> <nop>

    " Buftabline toggle
    nnoremap <silent> <leader>b :call BuftablineToggle()<cr>

    function! BuftablineToggle()
        if g:buftabline_show == 0
            let g:buftabline_show = 1
            call buftabline#update(0)
        else
            let g:buftabline_show = 0
            call buftabline#update(0)
        endif
    endfunction

    " Remove trailing spaces
    nnoremap <silent> <leader>W :%s/\s\+$//<CR>:let @/=''<CR><C-o>

    " Yank and paste X11 clipboard
    nnoremap gp "+p
    nnoremap gP "+P
    "nnoremap gP "*p
    vnoremap gy "+y
    "vnoremap gY "*y

    " Reselect pasted text
    nnoremap <leader>v V`]

    " Reindent / Format / Prettify
    nnoremap <silent> <leader>p ggVGgq2<C-o>
    nnoremap <silent> <leader>pp ggVGgq2<C-o>
    " csv - quick and dirty
    nnoremap <silent> <leader>pc :Tabularize /,\zs<cr>
    vnoremap <silent> <leader>pc :Tabularize /,\zs<cr>
    "nnoremap <silent> <leader>pc :!csvtool readable -<cr>
    " xml
    nnoremap <silent> <leader>px :%!xmllint --recover --format -<cr>
    vnoremap <silent> <leader>px :!xmllint --recover --format -<cr>
    "nnoremap <silent> <leader>px :!xmllint --format --html --xmlout<cr>
    " html
    nnoremap <silent> <leader>ph :%!pandoc -f html -t html<cr>
    vnoremap <silent> <leader>ph :!pandoc -f html -t html<cr>

    " abbreviations
    iabbrev ymd <C-R>=strftime("%F")<CR>

    " Toggle line numbers on fold column for easy copying
    "nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
    nnoremap <silent> <F2> :set nonumber!<CR>:set norelativenumber!<cr>
    " Toggle Indent guides
    nnoremap <silent> <F3> :IndentGuidesToggle<cr>
    " Toggle Tagbar
    nnoremap <silent> <F4> :TagbarToggle<CR>

    " High light search
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)

    " Clear highlighted search, need to test to know what version I want!
    nnoremap <silent> <CR> :nohlsearch<CR><CR>
    nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

    " " Use `[c` and `]c` for navigate diagnostics
    " nnoremap <silent> [c <Plug>(coc-diagnostic-prev)
    " nnoremap <silent> ]c <Plug>(coc-diagnostic-next)

    " " Remap keys for gotos
    " nnoremap <silent> gd <Plug>(coc-definition)
    " nnoremap <silent> gy <Plug>(coc-type-definition)
    " nnoremap <silent> gi <Plug>(coc-implementation)
    " nnoremap <silent> gr <Plug>(coc-references)

    " Use K for show documentation in preview window
    " nnoremap <silent> K :call <SID>show_documentation()<CR>

    " nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
    " nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    " nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    " " nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
    " nnoremap <silent> <F6> :call LanguageClient#textDocument_rename()<CR>
    " nnoremap <C-Space> :call g:LanguageClient_contextMenu()<CR>

    " " Remap for rename current word
    " nmap <leader>rn <Plug>(coc-rename)

    " " Remap for format selected region
    " vmap <leader>f  <Plug>(coc-format-selected)
    " nmap <leader>f  <Plug>(coc-format-selected)

    " " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    " vmap <leader>as  <Plug>(coc-codeaction-selected)
    " nmap <leader>as  <Plug>(coc-codeaction-selected)

    " " Remap for do codeAction of current line
    " nmap <leader>ca  <Plug>(coc-codeaction)
    " " Remap for do codelens-action of current line
    " nmap <leader>cl  <Plug>(coc-codelens-action)
    " " Fix autofix problem of current line
    " nmap <leader>qf  <Plug>(coc-fix-current)

    "" Using CocList
    "" Show all diagnostics
    "nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    "" Manage extensions
    "nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    "" Show commands
    "nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    "" Find symbol of current document
    "nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    "" Search workspace symbols
    "nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    "" Do default action for next item.
    "nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    "" Do default action for previous item.
    "nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    "" Resume latest coc list
    "nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
    """"

    " these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
    nmap <silent> <leader>tn :TestNearest<CR>
    nmap <silent> <leader>tf :TestFile<CR>
    nmap <silent> <leader>ts :TestSuite<CR>
    nmap <silent> <leader>tl :TestLast<CR>
    nmap <silent> <leader>tv :TestVisit<CR>

    " ROT13 - fun
    "map <F12> ggVGg?

    " Use shorter for n. pattern
    nnoremap <C-å> n.

    " Make Arrow Keys Useful Again {
    "    map <down> <ESC>:bn<RETURN>
    "    map <left> <ESC>:NERDTreeToggle<RETURN>
    "    map <right> <ESC>:Tlist<RETURN>
    "    map <up> <ESC>:bp<RETURN>
    " }

    " nnoremap <leader>, :CtrlPBuffer<CR>
    " nnoremap <leader>. :CtrlP .<CR>
    nnoremap <leader>. :FZF .<CR>

    " Window movements
    nnoremap <C-j> <C-W>j
    nnoremap <C-k> <C-W>k
    nnoremap <C-h> <C-W>h
    nnoremap <C-l> <C-W>l

    " FSwitch
    nnoremap <leader>o :FSSplitAbove<CR>

    " Fix for minibufexplorer and vimdiff (fugitive's Gdiff)
    " let g:miniBufExplorerHideWhenDiff = 1

    " Spell
    "map <leader>ss :setlocal spell!
    "map <leader>sn ]s
    "map <leader>np [s
    "map <leader>sa zg
    "map <leader>s? z=

    " I always let go of shift too slow...
    cab Q q
    cab W w
    cab X x
" }

" Autocommands {
    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
    " Remember info about open buffers on close
    " set viminfo^=%

    " Use local formatexpr instead of gloabl formatprg, stolen from Drew Neil
    function! FormatprgLocal(filter)
        if !empty(v:char)
            return 1
        else
            let l:command = v:lnum.','.(v:lnum+v:count-1).'!'.a:filter
            echo l:command
            execute l:command
        endif
    endfunction

    " C {
        function FT_C()
            set autowrite
            "set noexpandtab
            set tabstop=4
            set shiftwidth=4

            set cindent
            set cino=(0,:0
            "         |  +--------- case placement
            "         +------------ second line parameter placement
            set autoindent
            set smartindent
            set sm smd
            " set nomesg sm smd
            set fo=croq

            " Complete options (disable preview scratch window)
            " set completeopt=menuone,preview
            " set completeopt-=preview
            " Limit popup menu height
            set pumheight=15

            " SuperTab option for context aware completion
            "let g:SuperTabDefaultCompletionType = "context"

            " Cscope
            if has("cscope")
                    " cs tag order = 0 => first cs then tag
                    set csto=0
                    " cs tag use cstag instead of tags
                    set cst
                    set csverb

                    map <C-_> m':cstag <C-R>=expand("<cword>")<CR><CR>
                    map g<C-]> m':cs find g <C-R>=expand("<cword>")<CR><CR>
                    map g<C-\> m':cs find s <C-R>=expand("<cword>")<CR><CR>
            endif

            if has("insert_expand")
                    set showfulltag
            endif

            " YouCompleteMe
            " nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

            " finds the current function in C
            noremap <leader>f mk[[?^[A-Za-z0-9_].*(<CR>V"ky`k:echo "<C-R>k"<CR>
            "  better version for C, doesn't always work though 8)
            noremap <leader>k  :?^{??^\k? mark k\|echo getline("'k")<cr>

            " Makes ctrl-g show the buffer # as well.
            noremap <C-G> 2<C-G>
        endfunction
        au BufRead,BufNewFile *.c,*.h call FT_C()
        " linux kernel at $HOME/source/linux.git/*
        autocmd BufNewFile,BufRead $HOME/source/linux.git/* set tabstop=8 shiftwidth=8 columns=80 colorcolumn=81 nolist

    " }
    " Markdown {
        au BufRead,BufNewFile *.md set filetype=markdown
        " au FileType markdown setlocal formatexpr=FormatprgLocal('test')
        " au FileType markdown setlocal formatexpr=FormatprgLocal("pandoc\ -f\ markdown\ -t\ markdown")
        au FileType markdown setlocal formatexpr=FormatprgLocal('pandoc\ -f\ markdown\ -t\ markdown')
    " }
    " HTML {
        au FileType html setlocal formatexpr=FormatprgLocal('pandoc\ -f\ html\ -t\ html')
        " au FileType html setlocal formatexpr=FormatprgLocal('xmllint\ --format\ --html\ --xmlout')
    " }
    " XML {
        au FileType html setlocal formatexpr=FormatprgLocal('xmllint\ --format')
    " }
    " Elixir {
        au FileType elixir setlocal formatexpr=FormatprgLocal('mix\ --format\ -')
    " }
    " Python {
        " Tests
        au FileType python nnoremap <localleader>t :!nose2<cr>
    " }
    " Ruby {
        " ruby standard 2 spaces, always
        au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
        au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
    " }
    " Mail {
        au BufRead,BufNewFile *mutt-* set filetype=mail
    " }
    " Notes {
        " I consider .notes files special, and handle them differently, I
        " should probably put this in another file
        au BufRead,BufNewFile *.notes set foldlevel=2
        au BufRead,BufNewFile *.notes set foldmethod=indent
        au BufRead,BufNewFile *.notes set tabstop=8
        au BufRead,BufNewFile *.notes set syntax=notes
        au BufRead,BufNewFile *.notes set nocursorcolumn
        au BufRead,BufNewFile *.notes set nocursorline
        au BufRead,BufNewFile *.notes set guifont=Consolas:h12
        au BufRead,BufNewFile *.notes set spell
    " }
    au BufNewFile,BufRead *.ahk setf ahk
" }

" " adds to statusline
" set laststatus=2
" set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}

 " a little more informative version of the above
 nmap <Leader>st :so $VIMRUNTIME/syntax/hitest.vim<CR>
 nmap <Leader>sp :call <SID>SynStack()<CR>

 function! <SID>SynStack()
     if !exists("*synstack")
         return
     endif
     echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
 endfunc

" GUI Settings {
if has("gui_running")
    " Basics {
        "colorscheme metacosm    " already set through csapprox
        "set columns=180          " perfect size for me
        set columns=120          " perfect size for me
        set guifont=Consolas:h10 " My favorite font
        set guioptions=ce
        "              ||
        "              |+-- use simple dialogs rather than pop-ups
        "              +  use GUI tabs, not console style tabs
        set lines=55 " perfect size for me
        set mousehide " hide the mouse cursor when typing
    " }

    " Font Switching Binds {
        map <F8> <ESC>:set guifont=Consolas:h8<CR>
        map <F9> <ESC>:set guifont=Consolas:h10<CR>
        map <F10> <ESC>:set guifont=Consolas:h12<CR>
        map <F11> <ESC>:set guifont=Consolas:h16<CR>
        map <F12> <ESC>:set guifont=Consolas:h20<CR>
    " }
endif
" }
