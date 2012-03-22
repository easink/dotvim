" Modeline and Notes {
"   vim: set foldmarker={,} foldlevel=0 spell:
"
"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the "   pieces you want(and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen.
"
"   If you find an obvious mistake hit me up at:
"   http://robertmelton.com/contact (many forms of communication)
" }

" Pathogen {
    " Run this first...
    filetype off
    call pathogen#runtime_append_all_bundles()
    call pathogen#helptags()
" }

" Basics {
    set nocompatible     "  explicitly get out of vi-compatible mode
    set noexrc           "  don't use local version of .(g)vimrc, .exrc
    "set background=dark "  we plan to use a dark background
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor
    "             |||||||      between joined lines
    "             |||||||+-- When a new match is created (showmatch)
    "             ||||||      pause for .5
    "             ||||||+-- Set buffer options when entering the
    "             |||||      buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> to the last line
    "             |||      when using :@r
    "             |||+-- Searching continues at the end of the match
    "             ||      at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    syntax on " syntax highlighting on

    colorscheme mustang
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
    set numberwidth=4            " We are good up to 9999 lines
    "set report=0                " tell us when anything is changed via :...
    set ruler                    " Always show current positions along the bottom
    set scrolloff=10             " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT          " shortens messages to avoid 'press a key' prompt
    set showcmd                  " show the command being typed
    set showmatch                " show matching brackets
    set sidescrolloff=10         " Keep 5 lines at the size
    set statusline=%F\ %m%r%h%w%{fugitive#statusline()}%=%y\ [%{&ff}]\ %l,%v\ %p%%
    "set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%l,%v]%=%{fugitive#statusline()}
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in
    "              | | | | |  |   |          square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer
" }

" Text Formatting/Layout {
    set completeopt=menuone " show pop up menu for completions
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

    " TagList Settings {
        let Tlist_Auto_Open=0              " let the tag list open automagically
        let Tlist_Compact_Format = 1       " show small menu
        let Tlist_Ctags_Cmd = 'ctags'      " location of ctags
        let Tlist_Enable_Fold_Column = 0   " do show folding tree
        let Tlist_Exist_OnlyWindow = 1     " if you are the last, kill yourself
        let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
        let Tlist_Sort_Type = "name"       " order by
        let Tlist_Use_Right_Window = 1     " split to the right side of the screen
        let Tlist_WinWidth = 40            " 40 cols wide, so i can (almost always) read my functions
        " Language Specifics {
            " just functions and classes please
            let tlist_aspjscript_settings = 'asp;f:function;c:class' 
            " just functions and subs please
            let tlist_aspvbs_settings = 'asp;f:function;s:sub' 
            " don't show variables in freaking php
            let tlist_php_settings = 'php;c:class;d:constant;f:function' 
            " just functions and classes please
            let tlist_vb_settings = 'asp;f:function;c:class' 
        " }
    " }
" }

" Mappings {
    let mapleader = ","

    "remove trailing spaces
    nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

    "reselect pasted text
    nnoremap <leader>v V`]

    " ROT13 - fun
    "map <F12> ggVGg?

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
    map <C-Left> :bprev<CR>
    map <C-Right> :bnext<CR>
    imap <C-Left> <Esc>:bprev<CR><insert>
    imap <C-Right> <Esc>:bnext<CR><insert>

    " I always let go of shift too slow...
    cab Q q
    cab W w
    cab X x
" }

" Autocommands {
    " C {
        function FT_C()
            set autowrite
            "set noexpandtab
            set tabstop=4
            set shiftwidth=4

            set cindent
            set autoindent
            set smartindent
            set nomesg sm smd
            set fo=croq

            " Complete options (disable preview scratch window)
            set completeopt=menu,menuone,longest
            " Limit popup menu height
            set pumheight=15

            " SuperTab option for context aware completion
            "let g:SuperTabDefaultCompletionType = "context"

            " Disable auto popup, use <Tab> to autocomplete
            let g:clang_complete_auto = 0
            " Show clang errors in the quickfix window
            let g:clang_complete_copen = 1
            " Use libclang for spedd and features
            let g:clang_use_library = 1

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

            " finds the current function in C
            noremap <leader>f mk[[?^[A-Za-z0-9_].*(<CR>V"ky`k:echo "<C-R>k"<CR>
            "  better version for C, doesn't always work though 8)
            noremap <leader>k  :?^{??^\k? mark k\|echo getline("'k")<cr>
            " finds the current function in perl
            noremap <leader>p mk?^sub <CR>wve"ky'k:echo "<C-R>k"<CR>

            " Makes ctrl-g show the buffer # as well.
            noremap <C-G> 2<C-G>
        endfunction
        au BufRead,BufNewFile *.c,*.h call FT_C()
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
        set columns=180          " perfect size for me
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
