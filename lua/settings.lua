-- options.lua
--  vim: foldlevel=0 spell:

-- General {{{

--    set nocompatible     "  explicitly get out of vi-compatible mode
--    set noexrc           "  don't use local version of .(g)vimrc, .exrc

vim.opt.cpoptions = 'aABceFsmq'
--                   |||||||||
--                   ||||||||+-- When joining lines, leave the cursor
--                   ||||||||     between joined lines
--                   |||||||+-- When a new match is created (showmatch) |||||||     pause for .5
--                   ||||||+-- Set buffer options when entering the
--                   ||||||     buffer
--                   |||||+-- :write command updates current file name
--                   ||||+-- Automatically add <CR> to the last line
--                   ||||     when using :@r
--                   |||+-- Searching continues at the end of the match
--                   |||     at the cursor position
--                   ||+-- A backslash has no special meaning in mappings
--                   |+-- :write updates alternative file name
--                   +-- :read updates alternative file name

--     filetype plugin indent on        " load filetype plugins/indent settings

--     "set autochdir                   " always switch to the current file directory
vim.opt.backspace = 'indent,eol,start'  -- make backspace a more flexible
--     " set undofile                     " make persistent undo files throughout sessions
--     " set undodir=~/.vim/undodir       " where to put undo files
vim.opt.backup = true                   -- make backup files
vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup'     -- where to put backup files
-- 'backupdir' 'bdir'	string	(default ".,$XDG_STATE_HOME/nvim/backup//")
--     "set clipboard+=unnamed          " share windows clipboard
--vim.opt.directory = vim.fn.expand('$HOME/.config/nvim/tmp')        -- directory to place swap files in
--     "set fileformats=unix,dos,mac    " support all three, in this order
vim.opt.hidden = true                    -- you can change buffers without saving
--     "(XXX: #VIM/tpope warns the line below could break things)
--     set iskeyword+=_,$,@,%,#         " none of these are word dividers
vim.opt.mouse = ''                      -- disable mouse everywhere
vim.opt.errorbells = false              -- don't make noise
--     "set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
--     "              | | | | | | | | |
--     "              | | | | | | | | +-- "]" Insert and Replace
--     "              | | | | | | | +-- "[" Insert and Replace
--     "              | | | | | | +-- "~" Normal
--     "              | | | | | +-- <Right> Normal and Visual
--     "              | | | | +-- <Left> Normal and Visual
--     "              | | | +-- "l" Normal and Visual (not recommended)
--     "              | | +-- "h" Normal and Visual (not recommended)
--     "              | +-- <Space> Normal and Visual
--     "              +-- <BS> Normal and Visual
vim.opt.wildmenu = true              -- turn on command line completion wild style
-- ignore these list file extensions
vim.opt.wildignore = '*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png'
vim.opt.wildmode = 'list:longest:full'   -- turn on wild mode huge list
-- " }}}

-- UI Settings {{{
vim.opt.colorcolumn = '120'          -- highligth column 120
--     "set cursorcolumn             " highlight the current column
-- vim.opt.cursorline = true            -- highlight current line
vim.opt.incsearch = true             -- BUT do highlight as you type you search phrase
vim.opt.laststatus = 2               -- always show the status line
vim.opt.lazyredraw = true             -- do not redraw while running macros
--     set linespace=0               " don't insert any extra pixel lines betweens rows
vim.opt.list = true                  -- we do what to show tabs, and trailing
vim.opt.listchars = 'tab:>-,trail:-' -- " show tabs and trailing
--     set matchtime=5               " how many tenths of a second to blink matching brackets for
vim.opt.hlsearch = true              -- highlight searched for phrases
vim.opt.startofline = false          -- leave my cursor where it was
vim.opt.visualbell = false           -- don't blink
vim.opt.number = true                -- turn on line numbers
vim.opt.relativenumber = true        -- turn on relative line numbers
vim.opt.numberwidth = 4              -- We are good up to 9999 lines
--     "set report=0                 " tell us when anything is changed via :...
vim.opt.ruler = true                 -- Always show current positions along the bottom
vim.opt.scrolloff = 10               -- Keep 10 lines (top/bottom) for scope
vim.opt.shortmess = 'aOstT'          -- shortens messages to avoid 'press a key' prompt
vim.opt.showcmd = true                -- show the command being typed
vim.opt.showmatch = true              -- show matching brackets
vim.opt.sidescrolloff = 10          -- Keep 5 lines at the size
--     "set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%l,%v]%=%{fugitive#statusline()}
-- vim.opt.statusline = '[%n]\ %t\ %F\ %m%r%h%w%{fugitive#statusline()}%=%y\ [%{&ff}]\ %l,%v\ %p%%'
vim.opt.statusline = '[%n] %t %F %m%r%h%w%{fugitive#statusline()}%=%y [%{&ff}] %l,%v %p%%'
--                               | | | | |  |   |      |  |     |    |
--                               | | | | |  |   |      |  |     |    + current
--                               | | | | |  |   |      |  |     |       column
--                               | | | | |  |   |      |  |     +-- current line
--                               | | | | |  |   |      |  +-- current % into file
--                               | | | | |  |   |      +-- current syntax in
--                               | | | | |  |   |          square brackets
--                               | | | | |  |   +-- current fileformat
--                               | | | | |  +-- number of lines
--                               | | | | +-- preview flag in square brackets
--                               | | | +-- help flag in square brackets
--                               | | +-- readonly flag in square brackets
--                               | +-- rodified flag in square brackets
--                               +-- full path to file in the buffer
-- }}}

-- Text Formatting/Layout {{{
--     "set completeopt=menuone " show pop up menu for completions
--     "set completeopt=menu,menuone,longest " show pop up menu for completions
vim.opt.completeopt:remove('preview') -- show pop up menu for completions
--     " set diffopt+=algorithm:patience  " better diff
vim.opt.formatoptions = 'rq'  -- Automatically insert comment leader on return, and let gq format comments
vim.opt.ignorecase = true     -- case insensitive by default
vim.opt.infercase = true      -- case inferred by default
vim.opt.wrap = false          -- do not wrap line
vim.opt.shiftround = true     -- when at 3 spaces, and I hit > ... go to 4, not 5
vim.opt.smartcase = true      -- if there are caps, go case-sensitive
vim.opt.shiftwidth = 4        -- auto-indent amount when using cindent, >>, << and stuff like that
vim.opt.softtabstop = 4       -- when hitting tab or backspace, how many spaces should a tab be (see expandtab)
vim.opt.tabstop = 4           -- real tabs should be 8, and they will show with set list on
--    "set smarttab           " ????
vim.opt.expandtab = true      -- no real tabs please!
-- }}}

-- Folding {{{
vim.opt.foldenable = true                                 -- Turn on folding
-- vim.opt.foldmarker = '{,}'                                -- Fold C style code (only use this as default
                                                          -- if you use a high foldlevel)
vim.opt.foldmethod = 'marker'                             -- Fold on the marker
vim.opt.foldlevel = 100                                   -- Don't autofold anything (but I can still fold manually)
--     set foldopen=block,hor,mark,percent,quickfix,tag   " what movements
--                                                        " open folds
--     function SimpleFoldText()                          " {
--         return getline(v:foldstart).' '
--     endfunction                                        " }
--     set foldtext=SimpleFoldText()                      " Custom fold text function
-- }}}

-- entire file text object
vim.cmd [[ onoremap ae :<c-u>normal! mzggVG<cr>`z ]]

-- " " adds to statusline
-- " set laststatus=2
-- " set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}

--  " a little more informative version of the above
--  nmap <Leader>st :so $VIMRUNTIME/syntax/hitest.vim<CR>
--  nmap <Leader>sp :call <SID>SynStack()<CR>

--  function! <SID>SynStack()
--      if !exists("*synstack")
--          return
--      endif
--      echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
--  endfunc

-- GUI Settings {{{
-- if has("gui_running")
--     " Basics {
--         "colorscheme metacosm    " already set through csapprox
--         "set columns=180          " perfect size for me
--         set columns=120          " perfect size for me
--         set guifont=Consolas:h10 " My favorite font
--         set guioptions=ce
--         "              ||
--         "              |+-- use simple dialogs rather than pop-ups
--         "              +  use GUI tabs, not console style tabs
--         set lines=55 " perfect size for me
--         set mousehide " hide the mouse cursor when typing
--     " }

--     " Font Switching Binds {
--         map <F8> <ESC>:set guifont=Consolas:h8<CR>
--         map <F9> <ESC>:set guifont=Consolas:h10<CR>
--         map <F10> <ESC>:set guifont=Consolas:h12<CR>
--         map <F11> <ESC>:set guifont=Consolas:h16<CR>
--         map <F12> <ESC>:set guifont=Consolas:h20<CR>
--     " }
-- endif
-- }}}
