" Modeline and Notes {
"   vim: set foldmarker={,} foldlevel=0 spell:
"
"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the "   pieces you want(and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen.
" }

" vim-plug {
    " Run this first...
    call plug#begin('~/.vim/plugged')

    " Special build function for YCM
    function! BuildYCM(info)
        " info is a dictionary with 3 fields
        " - name:   name of the plugin
        " - status: 'installed', 'updated', or 'unchanged'
        " - force:  set on PlugInstall! or PlugUpdate!
        if a:info.status == 'installed' || a:info.force
            !./install.sh
        endif
    endfunction

    " let Vundle manage Vundle
    "Plug 'gmarik/vundle'

    " Plugins

    " for the looks
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'godlygeek/csapprox'
    Plug 'HubbaBubbaFett/mustang'

    " features
    Plug 'haya14busa/incsearch.vim'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'kien/ctrlp.vim'
    "Plug 'wincent/Command-T'
    "Plug 'techlivezheng/vim-plugin-minibufexpl'
    "Plug 'fholgado/minibufexpl.vim'
    Plug 'chrisbra/Recover.vim'

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'gregsexton/gitv'
    "Plug 'tpope/vim-git'
    Plug 'http://www.tidraso.co.uk/repository/vim-plugin/'

    " text objects
    Plug 'tpope/vim-jdaddy'
    Plug 'sukima/xmledit'
    Plug 'godlygeek/tabular'
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-indent'
    Plug 'bps/vim-textobj-python', { 'for': 'python' }
    Plug 'coderifous/textobj-word-column.vim'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'jeetsukumaran/vim-indentwise'
    Plug 'rhysd/libclang-vim'
    Plug 'rhysd/vim-textobj-clang'

    " markdown
    Plug 'vim-pandoc/vim-pandoc'
    " Plug 'vim-pandoc/vim-pandoc-syntax'
    " Plug 'plasticboy/vim-markdown'

    " coding
    Plug 'majutsushi/tagbar'
    "Plug 'msanders/snipmate.vim'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdcommenter'
    " python bundles
    Plug 'klen/python-mode', { 'for': 'python' }
    Plug 'davidhalter/jedi-vim', { 'for': 'python' }
    " rust
    " Plug 'wting/rust.vim', { 'for': 'rust' }
    " Plug 'ebfe/vim-racer', { 'for': 'rust' }
    " Plug '~/source/racer/editors/racer.vim', { 'for': 'rust' }
    " python/c/c++ bundles
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    "Plug 'Rip-Rip/clang_complete'
    Plug 'derekwyatt/vim-fswitch'

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

    colorscheme mustang
    "complement to mustang...
    :hi ColorColumn guibg=#2d2d2d ctermbg=236
" }

" General {
    filetype plugin indent on        " load filetype plugins/indent settings

    "set autochdir                   " always switch to the current file directory
    set backspace=indent,eol,start   " make backspace a more flexible
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
    set completeopt=menu,menuone,longest " show pop up menu for completions
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

    " YouCompleteMe
    "let g:ycm_filetype_specific_completion_to_disable = {python}    " disable python code completion

    " Python-mode
    " let g:pymode_rope_vim_completion = 0    " disable pymode vim completion
    let pymode_lint_checkers = ['pep8', 'mccabe']   " ['pyflakes', 'pep8', 'mccabe']
    " let g:pymode_lint_ignore = "E501,E265,C0301" " ignore line to long error
    let g:pymode_lint_ignore = "E501"         " ignore line to long error
    " let g:pymode_rope = 0                    " disable rope
    " let g:pymode_rope_complete_on_dot = 0   " fix a freeze when using YCM

    " let g:syntastic_python_checker = 'pyflakes'
    " let g:syntastic_python_flake8_args = 
    "       \ '--ignore=W191,E501,E121,E122,E123,E128,E225,W291'
    " let pymode_lint = 0
    " au FileType python setlocal expandtab shiftwidth=4 tabstop=8
    "       \ formatoptions+=croq softtabstop=4 smartindent
    "       \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    " let python_highlight_all=1
    " let python_highlight_exceptions=0
    " let python_highlight_builtins=0

    " jedi-vim {
    " disable completion
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#popup_on_dot = 0
    let g:jedi#popup_select_first = 0
    let g:jedi#completions_enabled = 0
    let g:jedi#completions_command = ""
    let g:jedi#show_call_signatures = "1"

    let g:jedi#goto_assignments_command = "<leader>ja"
    let g:jedi#goto_definitions_command = "<leader>jd"
    let g:jedi#documentation_command = "<leader>jk"
    let g:jedi#usages_command = "<leader>ju"
    let g:jedi#rename_command = "<leader>jr"
    " }

    " Rust
    " racer
    " source /home/andreas/source/racer/editors/racer.vim
    let g:racer_cmd = "/home/andreas/source/racer/bin/racer"
    let $RUST_SRC_PATH = "/home/andreas/source/rust-nightly/src"

    " Minibufexplorer
    "let g:miniBufExplorerHideWhenDiff = 1   " Fix for minibufexplorer and vimdiff (fugitive's Gdiff)

    " YouCompleteMe
    let g:ycm_confirm_extra_conf = 0
    "let g:ycm_key_list_selection = ['<Down>']

    " Ultisnips
    "let g:UltiSnipsExpandTrigger = "<C-Tab>"
    "let g:UltiSnipsListSnippets = "<S-Tab>"
    "let g:UltiSnipsJumpForwardTrigger="<C-Tab>"
    "let g:UltiSnipsExpandTrigger = "<C-Tab>"
    "let g:UltiSnipsEditSplit = "vertical"
    let g:UltiSnipsListSnippets = "<C-h>"
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    " disable digraphs
    inoremap <C-K> <NOP>
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"    " TagList Settings {
"        let Tlist_Auto_Open=0              " let the tag list open automagically
"        let Tlist_Compact_Format = 1       " show small menu
"        let Tlist_Ctags_Cmd = 'ctags'      " location of ctags
"        let Tlist_Enable_Fold_Column = 0   " do show folding tree
"        let Tlist_Exist_OnlyWindow = 1     " if you are the last, kill yourself
"        let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
"        let Tlist_Sort_Type = "name"       " order by
"        let Tlist_Use_Right_Window = 1     " split to the right side of the screen
"        let Tlist_WinWidth = 40            " 40 cols wide, so i can (almost always) read my functions
"        " Language Specifics {
"            " just functions and classes please
"            let tlist_aspjscript_settings = 'asp;f:function;c:class'
"            " just functions and subs please
"            let tlist_aspvbs_settings = 'asp;f:function;s:sub'
"            " don't show variables in freaking php
"            let tlist_php_settings = 'php;c:class;d:constant;f:function'
"            " just functions and classes please
"            let tlist_vb_settings = 'asp;f:function;c:class'
"        " }
"    " }
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

    " ROT13 - fun
    "map <F12> ggVGg?

    " Use shorter for n. pattern
    nnoremap <C-å> n.

    " space / shift-space scroll in normal mode
    "noremap <S-space> <C-b>
    "noremap <space> <C-f>

    " Make Arrow Keys Useful Again {
    "    map <down> <ESC>:bn<RETURN>
    "    map <left> <ESC>:NERDTreeToggle<RETURN>
    "    map <right> <ESC>:Tlist<RETURN>
    "    map <up> <ESC>:bp<RETURN>
    " }

    " Buffer shifts
    " nnoremap <C-S-h> :bprev<CR>
    " nnoremap <C-S-l> :bnext<CR>
    " nnoremap <C-S-j> :bfirst<CR>
    " nnoremap <C-S-k> :blast<CR>
    " nnoremap <C-Left> :bprev<CR>
    " nnoremap <C-Right> :bnext<CR>
    " nnoremap <C-Up> :bfirst<CR>
    " nnoremap <C-Down> :blast<CR>
    " inoremap <C-Left> <Esc>:bprev<CR><insert>
    " inoremap <C-Right> <Esc>:bnext<CR><insert>

    nnoremap <leader>, :CtrlPBuffer<CR>
    nnoremap <leader>. :CtrlP<CR>

    " Window movements
    nnoremap <C-j> <C-W>j
    nnoremap <C-k> <C-W>k
    nnoremap <C-h> <C-W>h
    nnoremap <C-l> <C-W>l

    " Visual mode pressing * or # search for current selection
"    vnoremap <silent> * :call VisualSelection('f')<CR>
"    vnoremap <silent> # :call VisualSelection('b')<CR>

    " FSwitch
    nnoremap <leader>o :FSSplitAbove<CR>

    " Fix for minibufexplorer and vimdiff (fugitive's Gdiff)
    let g:miniBufExplorerHideWhenDiff = 1

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
    set viminfo^=%

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
            set nomesg sm smd
            set fo=croq

            " Complete options (disable preview scratch window)
            set completeopt=menuone,preview
            " Limit popup menu height
            set pumheight=15

            " SuperTab option for context aware completion
            "let g:SuperTabDefaultCompletionType = "context"

            " Debug clang_complete
            "let g:clang_debug = 1
            " May fix scan issue???
            "let g:clang_user_options='|| exit 0'
            " Enable snipmate
            "let g:clang_snippets = 1
            "let g:clang_snippets_engine = 'snipmate'
            " Disable auto popup, use <Tab> to autocomplete
            "let g:clang_complete_auto = 0
            " " Show clang errors in the quickfix window
            "let g:clang_complete_copen = 1
            " Use the lib instead for speed and functions
            "let g:clang_use_library = 1
            "let g:clang_library_path="/usr/lib/"
            " Correct libclang path
            "if has("gui_macvim")
            "        let g:clang_library_path = "/Developer/usr/clang-ide/lib/"
            "endif

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

            " C programming stuff
            "imap ;vmv void main(void) {<CR>}<Esc>ko
            "imap ;imi int<CR>main(int argc, char *argv[]) {<CR>}<Esc>ko
            "imap ;if if () {<CR>}<Esc>kf(a
            "imap ;inc #include <.h><ESC>2hi
            "imap ;def #define-
            "imap ;for for (;;) {<CR>}<Esc>kf(a

            " YouCompleteMe
            nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

            " finds the current function in C
            noremap <leader>f mk[[?^[A-Za-z0-9_].*(<CR>V"ky`k:echo "<C-R>k"<CR>
            "  better version for C, doesn't always work though 8)
            noremap <leader>k  :?^{??^\k? mark k\|echo getline("'k")<cr>

            " Makes ctrl-g show the buffer # as well.
            noremap <C-G> 2<C-G>
        endfunction
        au BufRead,BufNewFile *.c,*.h call FT_C()
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
    " Python {
        " Tests
        au FileType python nnoremap <localleader>t :!nose2<cr>
    " }
    " Ruby {
        " ruby standard 2 spaces, always
        au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
        au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
    " }
    " Notes {
        " I consider .notes files special, and handle them differently, I
        " should probably put this in another file
        au BufRead,BufNewFile *.notes set foldlevel=2
        au BufRead,BufNewFile *.notes set foldmethod=indent
        au BufRead,BufNewFile *.notes set foldtext=foldtext()
        au BufRead,BufNewFile *.notes set listchars=tab:\ \
        au BufRead,BufNewFile *.notes set noexpandtab
        au BufRead,BufNewFile *.notes set shiftwidth=8
        au BufRead,BufNewFile *.notes set softtabstop=8
        au BufRead,BufNewFile *.notes set tabstop=8
        au BufRead,BufNewFile *.notes set syntax=notes
        au BufRead,BufNewFile *.notes set nocursorcolumn
        au BufRead,BufNewFile *.notes set nocursorline
        au BufRead,BufNewFile *.notes set guifont=Consolas:h12
        au BufRead,BufNewFile *.notes set spell
    " }
    au BufNewFile,BufRead *.ahk setf ahk
" }

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
